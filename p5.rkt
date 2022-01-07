#lang racket
(require urlang urlang/for urlang/extra)
(require "p5-ids.rkt")
(require (for-syntax syntax/strip-context))

(provide (rename-out [module-begin-p5 #%module-begin]))

; thank you soegaard!
(define-syntax (module-begin-p5 stx)
  (syntax-case stx ()
    [(_module-begin-p5 . body)
     (with-syntax ([body (replace-context #'here #'body)])
       (syntax/loc stx
         (#%plain-module-begin
          (displayln (p5 . body)))))]))


(define-syntax-rule
  (drop-lines n string)
  (string-join
   (drop (string-split string "\n") n)
   "\n"))



(define-syntax-rule
  (p5 (expr ...))
  (with-syntax ([p5-defs-syntax (map (lambda (d) (datum->syntax #'here d))
                                     p5-defs)])
    ; urlang auto-prints the output, but we want a string instead
    (parameterize ([current-output-port (open-output-string)])
      (urlang
       (urmodule p5
                 ; this is a hack so urlang doesnt complain about all the p5 identifiers
                 p5-defs-syntax
                 expr ...))
      ; drop "use strict"
      ; TODO where did the defines go?
      (drop-lines 1 (get-output-string (current-output-port))))))


; https://p5js.org/examples/hello-p5-flocking.html
; TODO test boids (classes are weird)
; TODO output types: stdout/file, just code/html
; TODO give racket stuff
