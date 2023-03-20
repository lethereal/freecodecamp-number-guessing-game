#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#Query the username
echo "Enter your username:"
read USERNAME
while [[ ! "$USERNAME" =~ ^.{1,22}$ ]]
  do
    echo "Enter your username:"
    read USERNAME
  done
  
#Check if the user already exists
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
if [[ -z $USER_ID ]]
  then
    #New User
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_NEW_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
  else
    #Existing user
    GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM stats WHERE user_id = $USER_ID")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

#Start the game
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))
ATTEMPTS=0
#echo -e "Secret number test: $SECRET_NUMBER"

echo "Guess the secret number between 1 and 1000:"
read USER_GUESS
while [[ ! $USER_GUESS =~ ^[0-9]*$ ]]
do
  echo "That is not an integer, guess again:"
  read USER_GUESS
done

#Runs game logic
while [[ "$RESULT" != "correct" ]]
  do
    #Number checking logic
    if [[ $USER_GUESS -lt $SECRET_NUMBER ]]
      then
        RESULT="It's higher than that, guess again:"
    elif [[ $USER_GUESS -gt $SECRET_NUMBER ]]
      then
        RESULT="It's lower than that, guess again:"
    elif [[ $USER_GUESS -eq $SECRET_NUMBER ]]
      then
        RESULT="correct"
    fi
    ((ATTEMPTS++))

    #Game end condition 
    if [[ "$RESULT" != "correct" ]]
      then
        echo "$RESULT"
        read USER_GUESS
        while [[ ! $USER_GUESS =~ ^[0-9]*$ ]]
          do
            echo "That is not an integer, guess again:"
            read USER_GUESS
        done
    fi
done

#Finishes the game, inserts the results into the database
echo "You guessed it in $ATTEMPTS tries. The secret number was $SECRET_NUMBER. Nice job!"
INSERT_GAME=$($PSQL "INSERT INTO stats(user_id) VALUES($USER_ID)")
if [ $BEST_GAME -eq 0 ]
  then
    BEST_GAME=$ATTEMPTS
fi
if [ $ATTEMPTS -le $BEST_GAME ]
  then
    INSERT_BEST_GAME=$($PSQL "UPDATE users SET best_game = $ATTEMPTS WHERE user_id = $USER_ID")
fi
