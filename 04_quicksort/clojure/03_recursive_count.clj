(ns recursive-count)

(defn count-items [coll]
  (if (empty? coll)
    0
    (+ 1 (count-items (rest coll)))))

