#lang racket

(provide (rename-out [read-syntax-p5 read-syntax]))

(require "../p5.rkt")


(define (read-syntax-p5 src in)
  (define module-datum `(module p5-syntax p5/p5
                          ,(port->list (λ (in) (read-syntax src in)) in)))
  (datum->syntax #f module-datum))
