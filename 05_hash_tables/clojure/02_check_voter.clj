(ns check-voter)

(def voted (atom {}))

(defn check-voter [name]
  (if (get @voted name)
    (println "kick them out!")
    (do
      (swap! voted assoc name true)
      (println "let them vote!"))))

(check-voter "tom")
(check-voter "mike")
(check-voter "mike")

