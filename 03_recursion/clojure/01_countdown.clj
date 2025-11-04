(ns countdown)

;; Countdown with recursion
(defn countdown [i]
  (if (<= i 0)
    0
    (do
      (println i)
      (countdown (dec i)))))

(countdown 5)

