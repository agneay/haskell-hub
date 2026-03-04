-- ExprApplicative.hs

import Control.Applicative (liftA2)

-- Expression data type
data Expr
  = Val Int
  | Add Expr Expr
  | Sub Expr Expr
  | Mul Expr Expr
  | Div Expr Expr
  deriving (Show)

-- Evaluator using Applicatives (Maybe)
eval :: Expr -> Maybe Int
eval (Val x) = pure x
eval (Add a b) = liftA2 (+) (eval a) (eval b)
eval (Sub a b) = liftA2 (-) (eval a) (eval b)
eval (Mul a b) = liftA2 (*) (eval a) (eval b)
eval (Div a b) =
  let safeDiv x y =
        if y == 0 then Nothing else Just (x `div` y)
   in eval a >>= \x ->
        eval b >>= \y ->
          safeDiv x y

-- Alternative Div fully Applicative style:
-- eval (Div a b) =
--     liftA2 safeDiv (eval a) (eval b)
--   where
--     safeDiv x y =
--         if y == 0 then Nothing else Just (x `div` y)

-- Test cases
main :: IO ()
main = do
  let expr1 = Add (Val 10) (Mul (Val 2) (Val 3))
  let expr2 = Div (Val 10) (Val 0)
  let expr3 = Div (Val 20) (Add (Val 3) (Val 2))

  putStrLn "Expression 1:"
  print expr1
  print (eval expr1) -- Just 16
  putStrLn "\nExpression 2 (division by zero):"
  print expr2
  print (eval expr2) -- Nothing
  putStrLn "\nExpression 3:"
  print expr3
  print (eval expr3) -- Just 4