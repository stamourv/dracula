#lang scribble/doc
@(require
   scribble/manual
   scribble/eval
   racket/require
   (path-up "self/require.rkt")
   "../evaluator.rkt"
   (for-label
     (dracula-in main)))

@title{Unsupported}

The following ACL2 forms are not currently supported by Dracula.

@deftogether[(
@defthing[*STANDARD-CI* t]
@defthing[*STANDARD-CO* t]
@defthing[*STANDARD-OI* t]
@defform[(add-custom-keyword-hint ...)]
@defform[(allocate-fixnum-range fixnum-lo fixnum-hi)]
@defform[(assert-event ...)]
@defform[(boole$ op x y)]
@defform[(character-alistp any)]
@defform[(characters any)]
@defform[(comp ...)]
@defform[(comp-gcl x)]
@defform[(cw x)]
@defform[(cw! x)]
@defform[(defabbrev ...)]
@defform[(defchoose ...)]
@defform[(defcong ...)]
@defform[(defdoc ...)]
@defform[(defevaluator ...)]
@defform[(defexec ...)]
@defform[(define-trusted-clause-processor ...)]
@defform[(defmacro ...)]
@defform[(defn ...)]
@defform[(defpkg ...)]
@defform[(defrefinement ...)]
@defform[(defstobj ...)]
@defform[(defttag ...)]
@defform[(defun-sk ...)]
@defform[(e0-ord-< a b)]
@defform[(e0-ordinalp x)]
@defform[(encapsulate ...)]
@defform[(er x)]
@defform[(er-progn ...)]
@defform[(error1 x)]
@defform[(evisc-table ...)]
@defform[(flet (def1 ... defk) body)]
@defform[(fms ...)]
@defform[(fms! ...)]
@defform[(fmt ...)]
@defform[(fmt! ...)]
@defform[(fmt-to-comment-window ...)]
@defform[(fmt1 ...)]
@defform[(fmt1! ...)]
@defform[(getenv$ str state)]
@defform[(hard-error ctx str alist)]
@defform[(illegal ctx str alist)]
@defform[(in-arithmetic-theory ...)]
@defform[(kwote x)]
@defform[(kwote-lst lst)]
@defform[(local ...)]
@defform[(make-event ...)]
@defform[(mbe ...)]
@defform[(mbt ...)]
@defform[(memoize ...)]
@defform[(mod-expt i j k)]
@defform[(must-be-equal ...)]
@defform[(mv-nth n l)]
@defform[(open-input-channel-p x)]
@defform[(open-output-channel-p x)]
@defform[(peek-char$ ...)]
@defform[(pkg-witness ...)]
@defform[(pprogn ...)]
@defform[(print-object$ ...)]
@defform[(prog2$ x y)]
@defform[(progn ...)]
@defform[(progn! ...)]
@defform[(proofs-co ...)]
@defform[(read-object ...)]
@defform[(redo-flat ...)]
@defform[(remove-custom-keyword-hint ...)]
@defform[(search x y ...)]
@defform[(set-body ...)]
@defform[(set-bogus-mutual-recursion-ok x)]
@defform[(setenv$ str val)]
@defform[(show-custom-keyword-hint-expansion ...)]
@defform[(standard-co ...)]
@defform[(standard-oi ...)]
@defform[(sys-call ...)]
@defform[(sys-call-status ...)]
@defform[(table ...)]
@defform[(the ...)]
@defform[(unmemoize ...)]
@defform[(value-triple ...)]
@defform[(verify-guards ...)]
@defform[(verify-termination ...)]
)]
