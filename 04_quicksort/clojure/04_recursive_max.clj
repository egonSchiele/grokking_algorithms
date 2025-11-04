(ns recursive-max)

(defn find-max [coll]
  (if (empty? coll)
    0
    (if (= (count coll) 1)
      (first coll)
      (max (first coll) (find-max (rest coll))))))

