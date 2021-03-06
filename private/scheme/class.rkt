#lang scheme/base
(require scheme/contract scheme/class
         (for-syntax scheme/base))

(define class-or-interface/c (or/c class? interface?))

(define (subclass-or-implements/c class-or-iface)
  (cond
   [(class? class-or-iface) (subclass?/c class-or-iface)]
   [(interface? class-or-iface) (implementation?/c class-or-iface)]
   [else (error 'subclass-or-implements/c
                "not a class or interface: ~s"
                class-or-iface)]))

(define (object-provides/c . class-or-ifaces)
  (apply and/c object? (map is-a?/c class-or-ifaces)))

(define (class-provides/c . class-or-ifaces)
  (apply and/c class? (map subclass-or-implements/c class-or-ifaces)))

(define-syntax (mixin-provides/c stx)
  (syntax-case stx ()
    [(form (super-in ...)
           (sub-out ...))
     (with-syntax ([(super-var ...)
                    (generate-temporaries (syntax (super-in ...)))]
                   [(sub-var ...)
                    (generate-temporaries (syntax (sub-out ...)))])
       (syntax/loc stx
         (let* ([super-var super-in] ...
                [sub-var sub-out] ...)
           (->d ([super (class-provides/c super-var ...)])
                ()
                [_ (class-provides/c super sub-var ...)]))))]))

(define-syntax (send-each stx)
  (syntax-case stx ()
    [(se objs-expr method arg-expr ...)
     (with-syntax ([(arg-var ...) (generate-temporaries #'(arg-expr ...))])
       (syntax/loc stx
         (let ([objs-var objs-expr]
               [arg-var arg-expr]
               ...)
           (for-each (lambda (obj)
                       (send obj method arg-var ...))
                     objs-var))))]))

(define (ensure-interface iface<%> mx class%)
  (if (implementation? class% iface<%>)
      class%
      (mx class%)))

(provide/contract
 [class-or-interface/c flat-contract?]
 [object-provides/c
  (->* [] [] #:rest (listof class-or-interface/c) flat-contract?)]
 [class-provides/c
  (->* [] [] #:rest (listof class-or-interface/c) flat-contract?)]
 [ensure-interface
  (->d ([the-interface interface?]
        [the-mixin (mixin-provides/c [] [the-interface])]
        [the-class class?])
       ()
       [_ (class-provides/c the-class the-interface)])])

(provide mixin-provides/c send-each)
