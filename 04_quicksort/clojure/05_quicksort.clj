(ns quicksort)

(defn quicksort [coll]
  (if (< (count coll) 2)
    ;; base case, collections with 0 or 1 element are already "sorted"
    coll
    ;; recursive case
    (let [pivot (first coll)
          rest-items (rest coll)
          ;; sub-collection of all the elements less than or equal to the pivot
          less (filter #(<= % pivot) rest-items)
          ;; sub-collection of all the elements greater than the pivot
          greater (filter #(> % pivot) rest-items)]
      (concat (quicksort less) [pivot] (quicksort greater)))))

(println (quicksort [10 5 2 3]))

