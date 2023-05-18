#lang racket

(provide (rename-out [module-begin-p5 #%module-begin]))

(require urlang urlang/for urlang/extra
         "p5-ids.rkt"
         (for-syntax syntax/strip-context))

;;; options

(define output-file #f)

(define (set-options! . exprs)
  (filter (λ (e)
            (not ; set! is truthy so this will filter non-option exprs
             (match (syntax->datum e)
               [(list '^output-file file-name)
                (set! output-file
                      (open-output-file file-name #:exists 'replace))]
               [else #f])))
          exprs))

;;;

; thank you soegaard!
(define-syntax (module-begin-p5 stx)
  (syntax-case stx ()
    [(_module-begin-p5 . body)
     (with-syntax ([body (replace-context #'here #'body)])
       (syntax/loc stx
         (#%plain-module-begin
          (displayln (p5 . body)))))]))

(define-syntax-rule
  (p5 (expr ...))
  (with-syntax ([p5-defs-syntax (map (lambda (d) (datum->syntax #'here d))
                                     p5-defs)]
                [exprs-without-options
                 (map (λ (d) (datum->syntax #'here d))
                      (set-options! #'expr ...))])

    ; urlang auto-prints the output, but we want a string instead
    (parameterize ([current-output-port (open-output-string)])
      (urlang
       (urmodule p5
                 ; tell urlang about p5 identifiers
                 p5-defs-syntax
                 . exprs-without-options))

      (define urlang-res (get-output-string (current-output-port)))

      ; drop "use strict"
      (define res (string-join (rest (string-split urlang-res "\n")) "\n"))

      (when output-file
        (display res output-file)
        (close-output-port output-file))
      res)))
