#lang p5

(^output-file "draw-circles.js")

(define (setup)
  (createCanvas 400 400))
 
(define (draw)
  (fill (if mouseIsPressed
            0
            255))
  (ellipse mouseX mouseY
           80 80))
