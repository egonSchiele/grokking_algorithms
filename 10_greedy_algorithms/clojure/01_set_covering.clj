(ns set-covering)

;; You pass a collection in, and it gets converted to a set.
(def states-needed #{"mt" "wa" "or" "id" "nv" "ut" "ca" "az"})

(def stations {"kone" #{"id" "nv" "ut"}
               "ktwo" #{"wa" "id" "mt"}
               "kthree" #{"or" "nv" "ca"}
               "kfour" #{"nv" "ut"}
               "kfive" #{"ca" "az"}})

(defn my-set-covering [states-needed stations]
  (loop [remaining-states states-needed
         remaining-stations stations
         final-stations #{}]
    (if (empty? remaining-states)
      final-stations
      (let [best-station (reduce
                          (fn [best [station states-for-station]]
                            (let [covered (clojure.set/intersection remaining-states states-for-station)
                                  best-covered (if best
                                                 (clojure.set/intersection remaining-states (get remaining-stations best))
                                                 #{})]
                              (if (and (not (contains? final-stations station))
                                       (> (count covered) (count best-covered)))
                                station
                                best)))
                          nil
                          remaining-stations)]
        (if best-station
          (let [states-covered (clojure.set/intersection remaining-states
                                                          (get remaining-stations best-station))]
            (recur (clojure.set/difference remaining-states states-covered)
                   (dissoc remaining-stations best-station)
                   (conj final-stations best-station)))
          nil)))))

(println (my-set-covering states-needed stations))

