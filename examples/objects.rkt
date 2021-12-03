#lang p5
; port of https://p5js.org/examples/objects-objects.html
; by soegaard
(import this Jitter)

(define bug #f)

(define (setup)
  (createCanvas 710 400)
  (:= bug (new Jitter)))

(define (draw)
  (background 50 89 100)
  (bug.move)
  (bug.display))


(class Jitter
  [(constructor) (:= this.x (random width))
                 (:= this.y (random height))
                 (:= this.diameter (random 10 30))
                 (:= this.speed 1)]

  [(move)        (+= this.x (random (- this.speed) this.speed))
                 (+= this.x (random (- this.speed) this.speed))]

  [(display)     (ellipse this.x this.y this.diameter this.diameter)])
