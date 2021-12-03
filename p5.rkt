#lang racket
(require urlang)

(provide (rename-out [module-begin-p5 #%module-begin]))

; thank you soegaard!
(define-syntax (module-begin-p5 stx)
  (syntax-case stx ()
    [(_module-begin-p5 . body)
     (with-syntax ([body (datum->syntax #'here (syntax->datum #'body))])
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
  ; urlang auto-prints the output, but we want a string instead
  (parameterize ([current-output-port (open-output-string)])
    (urlang
     (urmodule p5
                 
               ; TODO subst or something
               ; TODO grab all p5 ids
               ; this is a hack so urlang doesnt complain about all the p5 identifiers
               (var this createVector createCanvas fill mouseIsPressed mouseX mouseY ellipse day text)
               expr ...))
    ; drop "use strict" and the p5 defines
    (drop-lines 2 (get-output-string (current-output-port)))))


; https://p5js.org/examples/hello-p5-flocking.html
; TODO test boids (classes are weird)
; TODO output types: stdout/file, just code/html
; TODO give racket stuff