(ns longest-common-subsequence)

(def dp-table-blue ["b" "l" "u" "e"])
(def dp-table-clues ["c" "l" "u" "e" "s"])

;; Create a 2D vector initialized with zeros
(def dp-table
  (atom (vec (repeat (count dp-table-blue)
                     (vec (repeat (count dp-table-clues) 0))))))

;; for each row
(doseq [i (range (count dp-table-blue))]
  ;; for each column
  (doseq [j (range (count dp-table-clues))]
    (if (= (nth dp-table-clues j) (nth dp-table-blue i))
      (let [prev-val (if (and (> i 0) (> j 0))
                       (get-in @dp-table [(dec i) (dec j)])
                       0)]
        (swap! dp-table assoc-in [i j] (inc prev-val)))
      (let [above (if (> i 0) (get-in @dp-table [(dec i) j]) 0)
            left (if (> j 0) (get-in @dp-table [i (dec j)]) 0)]
        (swap! dp-table assoc-in [i j] (max above left))))))

;; Display table
(doseq [row @dp-table]
  (println row))

