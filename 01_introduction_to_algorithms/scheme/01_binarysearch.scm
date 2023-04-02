(display "01_binarysearch")

(define (binary-search my-list item)
  (iter my-list item 0 (- (length my-list) 1)))

(define (iter my-list item low high)
  (if (> low high) 'nill
    (let* ((mid (floor (/ (+ low high) 2)))
          (guess (list-ref my-list mid)))
      (cond ((eqv? guess item) mid)
              ((> guess item) (iter my-list item low (- mid 1)))
              (else (iter my-list item (+ mid 1) high))))))


(newline)
(newline)
(display (binary-search (list 1 3 5 7 9) 3))
(newline)
(newline)
(display (binary-search (list 1 3 5 7 9) -1))
(newline)
(newline)