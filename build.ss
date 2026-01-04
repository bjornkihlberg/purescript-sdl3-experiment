#!chezscheme

(define output-dir "./bin")
(define entry-module-name "Main")

(unless (file-directory? output-dir) (mkdir output-dir))

(assert (zero? (system (format "cp ./chezscheme-corefn/prim.scm ~a" output-dir))))

(assert (zero? (system (format "purs compile -o ~a -g corefn --source-globs-file ./sourcefiles.txt" output-dir))))

(load "./chezscheme-corefn/corefn.scm")

(import (only (corefn) transpile-corefn-output-folder))

(format #t "compiling CoreFn to Chez Scheme in ~a folder\n" output-dir)

(transpile-corefn-output-folder output-dir)
