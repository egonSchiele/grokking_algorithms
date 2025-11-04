(ns filesystem-dfs)

(require '[clojure.java.io :as io])

(defn print-names [dir]
  ;; loop through every file and folder in the current folder
  (doseq [file (sort (.list (io/file dir)))]
    (let [fullpath (io/file dir file)]
      (if (.isFile fullpath)
        ;; if it is a file, print out the name
        (println file)
        ;; if it is a folder, call this function recursively on it
        ;; to look for files and folders
        (print-names (.getPath fullpath))))))

;; Uncomment to run:
;; (print-names "pics")

