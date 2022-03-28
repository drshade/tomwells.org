
use near_sdk::borsh::{self, BorshDeserialize, BorshSerialize};
use near_sdk::{env, near_bindgen};

near_sdk::setup_alloc!();

#[near_bindgen]
#[derive(Default, BorshDeserialize, BorshSerialize)]
pub struct Guestbook {
    guestbook: Vec<(String, String)>
}

#[near_bindgen]
impl Guestbook {
    #[init]
    pub fn new() -> Self {
        let mut res = Self::default();
        let account_id = env::signer_account_id();
        res.guestbook.push((account_id, "Deployed!".to_string()));
        res
    }

    pub fn add_message(&mut self, message: String) {
        let account_id = env::signer_account_id();
        self.guestbook.push((account_id, message));
    }

    pub fn get_messages(&self) -> Vec<(String, String)> {
        self.guestbook.clone()
    }
}

