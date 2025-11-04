(ns loop-sum)

(defn sum [arr]
  (reduce + arr))

(println (sum [1 2 3 4]))

