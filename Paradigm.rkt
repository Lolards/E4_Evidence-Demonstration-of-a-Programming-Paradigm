#lang racket
 
;; count-remove: counts minimum characters to remove so no 3 consecutive x's exist
;; lst: list of characters
;; consec: current count of consecutive x's seen

(define (count-remove lst consec)
  (cond
    [(null? lst) 0]                              ; base case: empty list
    [(and (equal? (car lst) #\x) (= consec 2))  ; third consecutive x -> must remove
     (+ 1 (count-remove (cdr lst) 2))]
    [(equal? (car lst) #\x)                      ; x but not yet at limit
     (count-remove (cdr lst) (+ consec 1))]
    [else                                         ; not x -> reset counter
     (count-remove (cdr lst) 0)]))
 
;; solve: receives a string and returns the minimum removals
(define (solve str)
  (count-remove (string->list str) 0))

;; Ejemplo
(solve "xxxiii")

