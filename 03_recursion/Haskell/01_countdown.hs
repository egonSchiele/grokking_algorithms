countdown :: Integer -> IO()
countdown n
  | n < 0 = return ()
  | otherwise = do
      putStrLn (show n)
      countdown (n-1)

main = do
  countdown 5