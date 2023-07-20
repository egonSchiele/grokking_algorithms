(define (find-smallest my-list)
  (let ((smallest (list-ref my-list 0))
        (smallest-i 0)
        (i 0)
        (last-index (- (length my-list) 1)))
    (iter-find my-list smallest-i smallest i last-index)))

(define (iter-find my-list smallest-i smallest i last-index)
  (if (> i last-index) 
      smallest-i
      (let ((my-list-i (list-ref my-list i)))
        (if (< my-list-i smallest)
            (iter-find my-list i my-list-i (+ i 1) last-index)
            (iter-find my-list smallest-i smallest (+ i 1) last-index)))))


(define (selection-sort my-list)
  (let* ((my-list-length (length my-list))
        (result (list))
        (i 0)
        (last-i (- my-list-length 1)))
    (iter-sort my-list i last-i result)))

(define (iter-sort my-list i last-i result)
  (if (> i last-i)
      result
      (let* ((smallest-i (find-smallest my-list))
            (smallest (list-ref my-list smallest-i))
            (filtered-list (filter (lambda (n) (not (= n smallest)))
                                   my-list))
            (new-result (append result (list smallest))))
        (iter-sort filtered-list (+ i 1) last-i new-result))))


(display (selection-sort (list 1 3 5 7 9))) ;; #(1 3 5 7 9)
(display (selection-sort (list 9 7 5 3 1))) ;; #(1 3 5 7 9)
(display (selection-sort (list 9 5 7 1 3))) ;; #(1 3 5 7 9)
