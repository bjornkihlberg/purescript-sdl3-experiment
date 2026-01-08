#!chezscheme

(import (chezscheme))

(define test-suite
  (list "Data.Function.spec.scm"
        "Data.Unit.spec.scm"))

(guard (e [(warning? e)
            (display "\x1b;[33m")
            (display-condition e)
            (display "\x1b;[0m")
            (newline)]

          [else
            (display "\x1b;[31m")
            (display-condition e)
            (display "\x1b;[0m")
            (newline)])

  (display "\x1b;[32mRunning tests ...\x1b;[0m\n")

  (for-each
    (lambda (test)
      (load-program (format #f "./tests/~a" test))
      (display (format #f " \x1b;[32m✓\x1b;[0m ~a\n" test)))
    test-suite)

  (display "\n\x1b;[32mAll tests passed!\x1b;[0m\n"))
