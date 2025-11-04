(ns breadth-first-search)

(defn person-is-seller? [name]
  (= (last name) \m))

(def graph {"you" ["alice" "bob" "claire"]
            "bob" ["anuj" "peggy"]
            "alice" ["peggy"]
            "claire" ["thom" "jonny"]
            "anuj" []
            "peggy" []
            "thom" []
            "jonny" []})

(defn search [name]
  (loop [search-queue [name]
         searched #{}]
    (when-not (empty? search-queue)
      (let [person (first search-queue)
            remaining-queue (rest search-queue)]
        ;; Only search this person if you haven't already searched them.
        (if (contains? searched person)
          (recur remaining-queue searched)
          (if (person-is-seller? person)
            (do
              (println (str person " is a mango seller!"))
              true)
            (do
              ;; Add all neighbors to the queue
              (recur (concat remaining-queue (get graph person []))
                     ;; Marks this person as searched
                     (conj searched person)))))))))

(search "you")

