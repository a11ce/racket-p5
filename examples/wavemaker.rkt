#lang p5

; direct translation of
; https://p5js.org/examples/interaction-wavemaker.html

(define t 0)

(define (setup)
  (createCanvas 600 600)
  (noStroke)
  (fill 20 200 40))

(define (draw)
  (background 10 10)
  (for ([x in-range 0 (+ width 30) 30])
    (for ([y in-range 0 (+ height 30) 30])
      (let* ([x-angle (map mouseX
                           0 width
                           (* -4 PI) (* 4 PI)
                           #t)]
             [y-angle (map mouseY
                            0 width
                            (* -4 PI) (* 4 PI)
                            #t)]
             [angle (+ (* x-angle
                          (/ x width))
                       (* y-angle
                          (/ y height)))]
             [myX (+ x
                     (* 20
                        (cos (+ angle (* 2 PI t)))))]
             [myY (+ y
                     (* 20
                        (sin (+ angle (* 2 PI t)))))])
        (ellipse myX myY 10))))
  (+= t 0.01))