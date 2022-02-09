#lang p5

(import HSL confirm)

(define (setup)
  (var [cnv (createCanvas windowWidth (- windowHeight 50))])
  (cnv.style "display" "block")
  (background 0 0 0)
  (noStroke)
  (noFill)
  (colorMode HSL)
  (changeTool "galaxy"))

(define cur-tool "galaxy")
(define shade-hue 0)

(define (point-in-circle rad act-f)
  (let* ([theta (random 0 TWO_PI)]
         [dist (act-f (random 0 100))])
    (array (* dist (cos theta))
           (* dist (sin theta)))))

(define (draw-stars)
  (let* ([p (point-in-circle 200 (lambda (x) x))]
         [size (random 1 4)]
         [hue (random 240 400)]
         [sat (random 50 100)]
         [lum (random 80 90)])
    (fill hue sat lum)
    (circle (+ mouseX (ref p 0))
            (+ mouseY (ref p 1))
            size)))


(define (draw-galaxy)
  (for ([idx in-range 0 4000])
    (let* ([p (point-in-circle 1000 (lambda (x) (randomGaussian x 1500)))]
           [size (random 2 3)]
           [hue (+ shade-hue (random -50 50))]
           [sat (random 30 70)]
           [alpha (random 0.1 0.3)])
      (fill hue sat 30 alpha)
      (circle (+ mouseX (ref p 0))
              (+ mouseY (ref p 1))
              size))))

(define (changeTool tool)
  (:= cur-tool tool)
  (let ([set-button-underline
         (lambda (name style)
           ((ref (select (+ "#button-" name)) "style")
            "text-decoration" style))])
    ((ref (array "stars" "galaxy") "map")
     (lambda (name)
       (set-button-underline name "none")))
    (set-button-underline tool "underline")))

(define (tryClear)
  (when (confirm "really clear canvas?")
    (background 0 0 0)))

(define (mousePressed)
  (when (= cur-tool "galaxy")
    (:= shade-hue (random 0 360)))
  (draw-with-cur-tool))

(define (mouseDragged)
  (draw-with-cur-tool))

(define (draw-with-cur-tool)
  (case cur-tool
    [("stars") (draw-stars)]
    [("galaxy") (draw-galaxy)]))