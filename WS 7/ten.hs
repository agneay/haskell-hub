import BankingADT

main :: IO ()
main = do
  let acc1 = createAccount 1 1000
  let acc2 = createAccount 2 500

  let acc1AfterDeposit = deposit acc1 200
  print (getBalance acc1AfterDeposit) -- 1200
  case withdraw acc1AfterDeposit 300 of
    Nothing -> putStrLn "Withdraw failed"
    Just acc -> print (getBalance acc) -- 900
  case transfer acc1AfterDeposit acc2 400 of
    Nothing -> putStrLn "Transfer failed"
    Just (newAcc1, newAcc2) -> do
      print (getBalance newAcc1) -- 800
      print (getBalance newAcc2) -- 900