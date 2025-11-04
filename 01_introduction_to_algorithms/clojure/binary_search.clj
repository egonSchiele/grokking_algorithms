(ns binary-search)

;; Iterative binary search
(defn search-iterative [coll item]
  (loop [low 0
         high (dec (count coll))]
    (when (<= low high)
      (let [mid (quot (+ low high) 2)
            guess (nth coll mid)]
        (cond
          (= guess item) mid
          (> guess item) (recur low (dec mid))
          :else (recur (inc mid) high))))))

;; Recursive binary search
(defn search-recursive [coll item]
  (letfn [(search [low high]
            (when (<= low high)
              (let [mid (quot (+ low high) 2)
                    guess (nth coll mid)]
                (cond
                  (= guess item) mid
                  (> guess item) (search low (dec mid))
                  :else (search (inc mid) high)))))]
    (search 0 (dec (count coll)))))

;; Example usage
(def my-list [1 3 5 7 9])

(println (search-iterative my-list 3))  ; => 1
(println (search-iterative my-list -1))  ; => nil

