#lang p5

(define (setup)
  (var [cnv (createCanvas windowWidth windowHeight)])
  (cnv.style "display" "block")
  (console.log windowHeight)
  (background 0 18 29)
  (stroke 255 255 255)
  (fill 0 18 29))

(define (windowResized)
  (resizeCanvas windowWidth windowHeight)
  (background 0 18 29))

(define (map-range x in-min in-max out-min out-max)
  (+ out-min
     (* (- x in-min)
        (/ (- out-max out-min)
           (- in-max in-min)))))

; this makes the animation loop, kinda neat
(define (looping-noise seed radius t)
  (let* ([theta (* 2 Math.PI t)]
         [x (* radius (Math.cos theta))]
         [y (* radius (Math.sin theta))])
    (noise (+ seed x) (+ seed y) (* 100 seed))))

; to get sharper peaks
(define (peak-eq x)
  (Math.max (* 2 (* x x x))
            (* 0.5 x)))

(define (two-val-seeded-random a b)
  (noise (* 100 a) (* 100 b)))
       

; to get the shape in the middle right.
; created with desmos and a lot of guessing
(define (shape-eq x seed)
  (Math.max (Math.min
             (* 10 (+ 0.1
                      (- (Math.pow
                          (/ x (+ 1.5
                                  (* 0.5
                                     (noise (* 100 seed)))))
                          2))))
             1)
            0.1))

(var (t 0)
     (num-lines 50)
     (num-peaks 30))

(define (draw)
  (background 0 18 29)
  (let* ([left-x (/ windowWidth 4)]
         [right-x (- windowWidth left-x)]
         [min-y (/ windowHeight 5)]
         [max-y (- windowHeight min-y)])
    (for ([idy in-range 0 num-lines])
      (var [cury (map-range idy 0 (- num-lines 1) min-y max-y)])
      
      (beginShape)
      (for ([idx in-range 0 num-peaks])
        (var [curx (+ (map-range idx 0 (- num-peaks 1) left-x right-x)
                      (two-val-seeded-random idx idy))])
        (vertex curx
                (- cury
                   (* (* windowHeight 0.15)
                      (shape-eq (map-range idx 0 29 -1 1) idy)
                      (peak-eq (looping-noise
                                      (two-val-seeded-random idx idy)
                                      1 t))))))
      (endShape)))
  
  (+= t 0.001))