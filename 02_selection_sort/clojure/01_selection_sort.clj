(ns selection-sort)

;; Finds the smallest value in a vector and returns its index
(defn find-smallest [arr]
  (let [smallest (first arr)
        smallest-index 0]
    (loop [i 1
           min-val smallest
           min-idx smallest-index]
      (if (>= i (count arr))
        min-idx
        (let [current (nth arr i)]
          (if (< current min-val)
            (recur (inc i) current i)
            (recur (inc i) min-val min-idx)))))))

;; Sort array using selection sort
(defn selection-sort [arr]
  (loop [remaining (vec arr)
         new-arr []]
    (if (empty? remaining)
      new-arr
      (let [smallest-index (find-smallest remaining)
            smallest (nth remaining smallest-index)
            before (if (> smallest-index 0) (subvec remaining 0 smallest-index) [])
            after (if (< smallest-index (dec (count remaining))) 
                    (subvec remaining (inc smallest-index)) 
                    [])]
        (recur (vec (concat before after))
               (conj new-arr smallest))))))

(println (selection-sort [5 3 6 2 10]))

