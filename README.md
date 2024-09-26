# Hangman Game

This is a simple Hangman game implemented in Ruby. The game allows users to play a new game or resume a previously saved game. The project is structured into two main classes: `Hangman` and `Game`.

![image](https://github.com/user-attachments/assets/b6479a5b-e7ee-4abf-a2e5-a19b044cd243)

## Table of Contents

- [Hangman Game](#hangman-game)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Features](#features)
  - [Installation](#installation)
  - [Usage](#usage)
    - [Starting a New Game](#starting-a-new-game)
    - [Loading a Previous Game](#loading-a-previous-game)
  - [Gameplay](#gameplay)
  - [Saving and Loading Games](#saving-and-loading-games)
    - [Saving a Game](#saving-a-game)
    - [Loading a Game](#loading-a-game)
  - [Contributing](#contributing)
    - [How to Contribute](#how-to-contribute)
  - [License](#license)

## Introduction

Hangman is a classic word-guessing game where the player tries to guess a hidden word by suggesting letters within a certain number of attempts. This implementation allows users to save their progress and resume the game later.

## Features

- **New Game**: Start a new Hangman game.
- **Load Game**: Resume a previously saved game.
- **Save Game**: Save the current game state to a file.
- **Word Selection**: Randomly selects a word from a predefined list of words.
- **Turns**: The player has 9 turns to guess the word.
- **User Input**: Validates user input to ensure it is a single letter.
- **Game State**: Displays the current state of the word and the number of turns left.

## Installation

To run this Hangman game, you need to have Ruby installed on your system. Follow these steps to get started:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Sandotech/hangman.git
   cd hangman
   ```

2. **Install Dependencies**:
   ```bash
   bundle install
   ```

3. **Run the Game**:
   ```bash
   ruby lib/game.rb
   ```

## Usage

When you run the game, you will be prompted to choose between starting a new game or loading a previous game.

### Starting a New Game

1. Choose option `2` to start a new game.
2. Enter a name to save the game.
3. Guess letters to uncover the hidden word.
4. Type `SAVE` to save the game and exit.

### Loading a Previous Game

1. Choose option `1` to load a previous game.
2. Select the game you want to resume from the list.
3. Continue guessing letters to uncover the hidden word.

## Gameplay

- **Turns**: You have 9 turns to guess the word.
- **Guessing**: Enter a single letter to guess. If the letter is in the word, it will be revealed.
- **Saving**: Type `SAVE` at any time to save the current game state and exit.
- **Winning**: You win if you guess the word before running out of turns.
- **Losing**: You lose if you run out of turns without guessing the word.

## Saving and Loading Games

### Saving a Game

- During gameplay, type `SAVE` to save the current game state.
- The game will be saved with the name you provided at the start of the game.

### Loading a Game

- When prompted, choose option `1` to load a previous game.
- Select the game you want to resume from the list.
- The game will be loaded, and you can continue from where you left off.

## Contributing

Contributions are welcome! If you have any ideas, suggestions, or bug reports, please open an issue or submit a pull request.

### How to Contribute

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add some feature'`).
5. Push to the branch (`git push origin feature/your-feature`).
6. Open a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Enjoy playing Hangman! If you have any questions or need further assistance, feel free to reach out.

<footer>
Diego Santos
</br>
Backend developer
</footer>
