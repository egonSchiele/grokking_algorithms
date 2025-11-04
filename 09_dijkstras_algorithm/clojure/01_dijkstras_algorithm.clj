(ns dijkstras-algorithm)

;; the graph
(def graph {"start" {"a" 6, "b" 2}
            "a" {"fin" 1}
            "b" {"a" 3, "fin" 5}
            "fin" {}})

;; the costs table
(def infinity Double/POSITIVE_INFINITY)
(def costs (atom {"a" 6, "b" 2, "fin" infinity}))

;; the parents table
(def parents (atom {"a" "start", "b" "start", "fin" nil}))

(def processed (atom []))

(defn find-lowest-cost-node [costs processed]
  (let [unprocessed (remove #(contains? processed %) (keys costs))
        costs-seq (map (fn [node] [node (get costs node)]) unprocessed)
        sorted-costs (sort-by second costs-seq)]
    (when (seq sorted-costs)
      (first (first sorted-costs)))))

;; Find the lowest-cost node that you haven't processed yet.
(loop [node (find-lowest-cost-node @costs @processed)]
  ;; If you've processed all the nodes, this loop is done.
  (when node
    (let [cost (get @costs node)
          ;; Go through all the neighbors of this node.
          neighbors (get graph node {})]
      (doseq [[n neighbor-cost] neighbors]
        (let [new-cost (+ cost neighbor-cost)]
          ;; If it's cheaper to get to this neighbor by going through this node...
          (when (> (get @costs n infinity) new-cost)
            ;; ... update the cost for this node.
            (swap! costs assoc n new-cost)
            ;; This node becomes the new parent for this neighbor.
            (swap! parents assoc n node))))
      ;; Mark the node as processed.
      (swap! processed conj node)
      ;; Find the next node to process, and loop.
      (recur (find-lowest-cost-node @costs @processed)))))

(println "Cost from the start to each node:")
(println @costs)

