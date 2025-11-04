(ns sum-array)

(defn sum-array [arr]
  (if (empty? arr)
    0
    (+ (first arr) (sum-array (rest arr)))))

