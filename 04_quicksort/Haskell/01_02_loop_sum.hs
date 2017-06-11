
sumarr [] = 0
sumarr (x: xs) = x + sumarr xs

main = putStrLn (show (sumarr [1,2,3,4]))