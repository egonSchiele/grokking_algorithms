(ns greet)

(defn greet2 [name]
  (println "how are you, " name "?"))

(defn bye []
  (println "ok bye!"))

(defn greet [name]
  (println "hello, " name "!")
  (greet2 name)
  (println "getting ready to say bye...")
  (bye))

(greet "adit")

