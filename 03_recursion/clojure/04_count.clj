(ns count)

(defn count-items [arr]
  (if (empty? arr)
    0
    (+ 1 (count-items (rest arr)))))

