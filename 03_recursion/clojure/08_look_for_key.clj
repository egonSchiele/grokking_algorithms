(ns look-for-key)

;; Represent items as maps
(defn make-item [is-key? items-in-box]
  {:is-key? is-key?
   :items-in-box items-in-box})

(defn is-a-box? [item]
  (not (:is-key? item)))

(defn is-a-key? [item]
  (:is-key? item))

(defn look-for-key [box]
  (doseq [item (:items-in-box box)]
    (if (is-a-box? item)
      ;; recursive case
      (look-for-key item)
      ;; base case
      (when (is-a-key? item)
        (println "found the key!")))))

;; Example structure:
;; main_box
;; ├── box_A
;; │   ├── box_B
;; │   └── box_C
;; └── box_D
;;     └── box_E
;;         └── key
(def key (make-item true []))
(def box-E (make-item false [key]))
(def box-D (make-item false [box-E]))
(def box-B (make-item false []))
(def box-C (make-item false []))
(def box-A (make-item false [box-B box-C]))
(def main-box (make-item false [box-A box-D]))

(look-for-key main-box)

