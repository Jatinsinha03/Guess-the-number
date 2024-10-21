#[starknet::interface]
trait IGuessTheNumber<TContractState> {
    fn set_secret_number(ref self: TContractState, number: u32);
    fn guess(ref self: TContractState, guess_number: u32) -> (u8, u32); // (feedback, attempts)
    fn get_attempts(ref self: TContractState) -> u32; // Get the number of attempts
}

#[starknet::contract]
mod GuessTheNumber {
    #[storage]
    struct Storage {
        secret_number: u32,
        attempts: u32,
    }

    #[constructor]
    fn constructor(ref self: ContractState) {
        // Initialize attempts to zero and secret_number to a default value
        self.attempts.write(0);
        self.secret_number.write(0); // Set a default secret number
    }

    #[abi(embed_v0)] // Ensure ABI embedding is required
    impl GuessTheNumber of super::IGuessTheNumber<ContractState> {
        fn set_secret_number(ref self: ContractState, number: u32) {
            // Set the secret number
            self.secret_number.write(number);
        }

        fn guess(ref self: ContractState, guess_number: u32) -> (u8, u32) {
            // Increment the attempts count
            let attempts = self.attempts.read() + 1;
            self.attempts.write(attempts);

            // Get the secret number
            let secret_number = self.secret_number.read();

            // Provide feedback
            if guess_number < secret_number {
                return (1, attempts); // 1 means "higher"
            } else if guess_number > secret_number {
                return (2, attempts); // 2 means "lower"
            } else {
                return (0, attempts); // 0 means "correct"
            }
        }

        fn get_attempts(ref self: ContractState) -> u32 {
            // Return the number of attempts
            self.attempts.read()
        }
    }
}
