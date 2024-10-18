# Guess the Number Game Smart Contract

## Overview

The "Guess the Number" game is a simple smart contract implemented in Cairo for the StarkNet platform. In this game, one player selects a secret number within a specified range, and the other player has to guess it. The contract provides feedback on each guess and tracks the number of attempts.

## Features

- One player can set a secret number.
- The second player can make guesses and receive feedback (higher, lower, or correct).
- The contract keeps track of the number of attempts made by the second player.

## Smart Contract Functions

### 1. set_secret_number(ref self: TContractState, number: u32)

- *Description*: Allows the first player to set a secret number.
- *Parameters*:
  - number: The secret number that the second player needs to guess.

### 2. guess(ref self: TContractState, guess_number: u32) -> (u8, u32)

- *Description*: Allows the second player to make a guess.
- *Parameters*:
  - guess_number: The number guessed by the second player.
- *Returns*:
  - A tuple:
    - u8: Feedback (0 = correct, 1 = higher, 2 = lower).
    - u32: The number of attempts made so far.

### 3. get_attempts(ref self: TContractState) -> u32

- *Description*: Returns the number of attempts made by the second player.
- *Returns*: 
  - u32: The total number of attempts.

## Example Usage

1. *Deploy the Contract*: 
   Deploy the contract and call the set_secret_number function to set the secret number.
   
   ```cairo
   contract.set_secret_number(42);
![WhatsApp Image 2024-10-18 at 20 03 29](https://github.com/user-attachments/assets/6e12416b-c278-4e27-8c44-c94e6b2fc376)

   

