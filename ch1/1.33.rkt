#lang racket
(require math/number-theory)
(define (filter-accumulate combiner null-value filter term a next b)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
                    (filter-accumulate combiner null-value filter term (next a) next b))
          (filter-accumulate combiner null-value filter term (next a) next b))))
  

;;Sum of prime numbers's squares
(define (sum-prime-sqr a b)
  (define (sqr x) (* x x))
  (define (inc n) (+ n 1))
  (filter-accumulate + 0 prime? sqr a inc b))

;;Product of positive numbers i < n, where i is prime based on n (gcd i n) -> 1
(define (product-primes-of-n i n)
  ;;Helpers
  (define (identity x) x)
  (define (inc n) (+ n 1))
  ;;GCD procedure (Euclid's algorithm)
  (define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
  ;;Prime checker
  (define (prime-n? x)
    (= 1 (gcd x n)))
  (filter-accumulate * 1 prime-n? identity i inc n))