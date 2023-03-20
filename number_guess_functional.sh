#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

CHECK_SECRET() {
SECRET_NUMBER=$1
USER_GUESS=$2

#Number checking logic
if [[ $USER_GUESS -lt $SECRET_NUMBER ]]
  then
    echo -e "It's higher than that, guess again:"
elif [[ $USER_GUESS -gt $SECRET_NUMBER ]]
  then
    echo -e "It's lower than that, guess again:"
elif [[ $USER_GUESS -eq $SECRET_NUMBER ]]
  then
    echo -e "correct"
fi
}

GAME() {
  #Read user guess
  SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))
  #echo -e "Secret number test: $SECRET_NUMBER"
  ATTEMPTS=0
  USER_ID=$1
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id = '$USER_ID'")

  read -p "Guess the secret number between 1 and 1000: " USER_GUESS
  while [[ ! $USER_GUESS =~ ^[0-9]*$ ]]
  do
    read -p "That is not an integer, guess again: " USER_GUESS
  done

  #Runs game logic
  while [[ "$RESULT" != "correct" ]]
  do
    RESULT=$(CHECK_SECRET "$SECRET_NUMBER" "$USER_GUESS")
    ((ATTEMPTS++))
    if [[ "$RESULT" != "correct" ]]
      then
        read -p "$RESULT " USER_GUESS
        while [[ ! $USER_GUESS =~ ^[0-9]*$ ]]
        do
          read -p "That is not an integer, guess again: " USER_GUESS
        done
    fi
  done

  #Finishes the game, inserts the results into the database
  echo -e "You guessed it in $ATTEMPTS tries. The secret number was $SECRET_NUMBER. Nice job!"
  INSERT_GAME=$($PSQL "INSERT INTO stats(user_id) VALUES($USER_ID)")
  if [ $BEST_GAME -eq 0 ]
    then
      BEST_GAME=$ATTEMPTS
  fi
  if [ $ATTEMPTS -le $BEST_GAME ]
    then
      INSERT_BEST_GAME=$($PSQL "UPDATE users SET best_game = $ATTEMPTS WHERE user_id = $USER_ID")
  fi
}

NEW_USER() {
  echo -e "Welcome, $1! It looks like this is your first time here."
  INSERT_NEW_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$1')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$1'")
  GAME "$USER_ID"
}

EXISTING_USER() {
  USER_INFO=$($PSQL "SELECT user_id, username, best_game FROM users WHERE username = '$1'")
  
  #Transfer user info to variables
  while IFS="|" read USER_ID USERNAME BEST_GAME
  do
    #Queries total number of games played
    GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM stats INNER JOIN users USING(user_id) WHERE user_id = '$USER_ID'")
    #In case the user is registered but never played before
    echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done <<< $USER_INFO
  
  #Call GAME while sending USER_ID for later use
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$1'")
  GAME "$USER_ID"
}

MAIN_MENU() {
  #Query the username
  read -p "Enter your username: " USERNAME
  while [[ ! "$USERNAME" =~ ^[a-zA-Z0-9]{1,22}$ ]]
  do
    read -p "Enter your username: " USERNAME
  done
  
  #Check if the user already exists
  USER_EXISTS=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
  if [[ -z $USER_EXISTS ]]
    then
      #Redirects to user creation fuction
      NEW_USER "$USERNAME"
    else
      #Redirects to the welcome back function
      EXISTING_USER "$USERNAME"
  fi
}

MAIN_MENU