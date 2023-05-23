#!/usr/bin/env csi -script

;; For the Chicken scheme system

(import
  (chicken time)
  (chicken time posix))

(define (current-hour-minute)
  (let ((time (seconds->local-time (current-seconds))))
    (let ((hour (modulo (vector-ref time 2) 12))
          (minute (vector-ref time 1)))
      (cons hour minute))))

(define hours
  '("twelve" "one" "two" "three" "four" "five"
    "six" "seven" "eight" "nine" "ten" "eleven" "twelve"))

(define minutes
  '("five past" "ten past" "a quarter past" "twenty past"
    "twenty-five past" "half past" "twenty-five to"
    "twenty to" "a quarter to" "ten to" "five to"))

(define (ishtime)
  (let ((hour (car (current-hour-minute)))
        (minute (cdr (current-hour-minute))))
    (if (or (<= minute 2) (> minute 57))
      (string-append "It's " (list-ref hours hour) " o'clock.")
      (string-append "It's "
                     (list-ref minutes (quotient (- minute 3) 5))
                     " "
                     (list-ref hours (+ hour (quotient minute 33)))
                     "."))))

(print (ishtime))
