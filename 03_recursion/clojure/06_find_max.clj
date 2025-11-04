(ns find-max)

(defn find-max [arr]
  (cond
    (empty? arr) 0
    (= (count arr) 1) (first arr)
    (= (count arr) 2) (max (first arr) (second arr))
    :else (let [sub-max (find-max (rest arr))]
            (max (first arr) sub-max))))

