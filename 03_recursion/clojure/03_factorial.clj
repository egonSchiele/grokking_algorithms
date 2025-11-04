(ns factorial)

(defn fact [x]
  (if (= x 1)
    1
    (* x (fact (dec x)))))

(println (fact 5))

