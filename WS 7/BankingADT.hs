module BankingADT
  ( Account,
    createAccount,
    deposit,
    withdraw,
    transfer,
    getBalance,
  )
where

-- Internal representation (hidden)
data Account = Account
  { accountId :: Int,
    balance :: Int
  }

-- Smart constructor
createAccount :: Int -> Int -> Account
createAccount accId initialBalance
  | initialBalance < 0 = error "Initial balance cannot be negative"
  | otherwise = Account accId initialBalance

-- Get balance
getBalance :: Account -> Int
getBalance (Account _ bal) = bal

-- Deposit (always succeeds)
deposit :: Account -> Int -> Account
deposit (Account accId bal) amount
  | amount <= 0 = Account accId bal
  | otherwise = Account accId (bal + amount)

-- Withdraw (fails if insufficient balance)
withdraw :: Account -> Int -> Maybe Account
withdraw (Account accId bal) amount
  | amount <= 0 = Just (Account accId bal)
  | amount > bal = Nothing
  | otherwise = Just (Account accId (bal - amount))

-- Transfer between accounts
transfer :: Account -> Account -> Int -> Maybe (Account, Account)
transfer from to amount =
  case withdraw from amount of
    Nothing -> Nothing
    Just newFrom ->
      let newTo = deposit to amount
       in Just (newFrom, newTo)