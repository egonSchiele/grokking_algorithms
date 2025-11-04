(ns recursive-sum)

(defn sum [coll]
  (if (empty? coll)
    0
    (+ (first coll) (sum (rest coll)))))

