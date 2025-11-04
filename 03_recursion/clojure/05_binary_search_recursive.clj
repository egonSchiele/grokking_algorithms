(ns binary-search-recursive)

(defn binary-search [arr target]
  (if (empty? arr)
    nil
    (let [mid (quot (count arr) 2)
          mid-val (nth arr mid)]
      (cond
        (= mid-val target) mid
        (> mid-val target) (binary-search (subvec arr 0 mid) target)
        :else (let [recursive-response (binary-search (subvec arr (inc mid)) target)]
                (if (nil? recursive-response)
                  nil
                  (+ (inc mid) recursive-response)))))))

(println (binary-search [6 7 8 9 10] 8))
(println (binary-search [6 7 8 9 10] 6))

