#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN() {
echo -e "Enter your username:"
read USERNAME
while [[ ${#USERNAME} -gt 25 || ${#USERNAME} -lt 1 ]]; do
   echo -e "Usernames must be between 1 and 25 characters, inclusive. Reenter your username:"
   read USERNAME
done

IFS="|" read GAMES_PLAYED BEST_GAME < <(echo $($PSQL "SELECT games_played,best_game FROM user_info WHERE username='$USERNAME'"))
if [[ -z $BEST_GAME ]]
then
	echo -e "Welcome, $USERNAME! It looks like this is your first time here."
	INSERT_USER_RESULT=$($PSQL "INSERT INTO user_info(username) VALUES('$USERNAME')")
else
	echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses." # best game is a number that is the fewest number of guesses it took to win that game. FCC prompt forces me to include a direct BEST_GAME reference with that exact text even if a returning user hasn't finished a game yet. 
fi

SECRET_NUMBER=$((RANDOM%1000+1)) # glad I remembered this. Modulo squashes the number to below the number on the right. Messes with the random distribution (lower number always more likely), but good enough.
NUMBER_OF_GUESSES=0
echo -e "Guess the secret number between 1 and 1000:"
read GUESS
while [[ $GUESS != $SECRET_NUMBER ]]; do
	if [[ ! $GUESS =~ ^[0-9]+$ ]]; then # if input is an integer. (starts with 0 through 9 plus any like-character after that)
		echo -e "That is not an integer, guess again:"
	else
		((NUMBER_OF_GUESSES++))
		if (( GUESS < SECRET_NUMBER )); then
			echo -e "It's higher than that, guess again:"
		elif (( GUESS > SECRET_NUMBER )); then
			echo -e "It's lower than that, guess again:"
		fi
	fi
	read GUESS
done
((NUMBER_OF_GUESSES++))
if [[ $NUMBER_OF_GUESSES -lt $BEST_GAME || -z $BEST_GAME ]]; then # alternative to fetching best_game from psql query after new user creation (would be the default #), or hardcoding a BEST_GAME=1000 after new user creation 
	UPDATE_BESTGAME_RESULT=$($PSQL "UPDATE user_info SET best_game = $NUMBER_OF_GUESSES WHERE username='$USERNAME'")
fi
((GAMES_PLAYED++)) # Moved this and the update down here, from just after `read GUESS`, to satisfy test. Otherwise, I would have preferred to count unfinished games in users' games_played records, by incrementing GAMES_PLAYED as soon as the first number is guessed. If GAMES_PLAYED is an empty string because it's a new user, ++ will make it "1"
UPDATE_GAMESPLAYED_RESULT=$($PSQL "UPDATE user_info SET games_played = $GAMES_PLAYED WHERE username='$USERNAME'")
echo -e "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
}

MAIN
# Thank you Freecodecamp!
