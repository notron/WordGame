# WordGame
In this game, The player has to guess if the word and translation both match or not (English, Spanish). If a player makes 15 total attempts or three wrong attempts, the current round ends and shows all history attempts on the app s result page, and the player can choose that play this game again or quit the app.

## App Architecture
* It uses a simple MVVM pattern with initializer-based dependency injection.
* It uses a clean architecture to split data, controller, and view
* There are three screens in the app with simple UI.
* I tried to develop simple and readable logic for the game.

## Time effort
* The total time effort put in is roughly 8 hours
* Planning: for thinking about what I want to do and drawing some think on paper and writing a blueprint: ~30M
* Model Layer: create the model's view and parse local data: ~30M
* Game Logic: implement game logic and all dependencies: ~2H
* ViewModels And ViewController: create all page views logic: ~2H
* UI: Because I think UI is essentially important, for all pages I spend: ~2H
* Check: for refactoring and fix some few bugs: ~30M
* Test: because I don't have enough time, I cant spend a good time for write testing, and if I have enough time, I improve this part, and I'll write more tests for game logic and another side and totally for this part I spend: ~30M
