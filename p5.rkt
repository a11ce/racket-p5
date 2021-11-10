#lang racket
; TODO #lang p5, mostly to hide macros
(require urlang)

(define-syntax-rule
  (drop-lines n string)
  (string-join
   (drop (string-split string "\n") n)
   "\n"))

(define-syntax-rule
  (p5 expr ...)
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
(displayln (p5
            (define (setup)
              (createCanvas 400 400))
 
            (define (draw)
              (fill (if mouseIsPressed
                        0
                        255))
              (ellipse mouseX mouseY
                       80 80))
            ))