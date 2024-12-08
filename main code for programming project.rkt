#lang racket


;; 1. Function to prompt and create a Band (using lists)
(define (sign-up-band)
  (display "Enter Band Name: ")
  (define band-name (read-line))
  
  (display "Enter Band Email: ")
  (define email (read-line))
  
  (display "Enter Band Phone Number: ")
  (define phone (read-line))
  
  (display "Enter Band Password: ")
  (define password (read-line))
  
 ; Create and return Band as a list of key-value pairs
  (list (cons 'type 'band)
        (cons 'band-name band-name)
        (cons 'email email)
        (cons 'phone phone)
        (cons 'password password)))

;; 2. Function to prompt and create a Fan (using lists)
(define (sign-up-fan)
  (display "Enter Username: ")
  (define username (read-line))
  
  (display "Enter Fan Email: ")
  (define email (read-line))
  
  (display "Enter Fan Phone Number: ")
  (define phone (read-line))
  
  (display "Enter Fan Date of Birth (YYYY-MM-DD): ")
  (define dob (read-line))
  
  (display "Enter Fan Password: ")
  (define password (read-line))
  
  ;; Create and return Fan as a list of key-value pairs
  (list (cons 'type 'fan)
        (cons 'username username)
        (cons 'email email)
        (cons 'phone phone)
        (cons 'date-of-birth dob)
        (cons 'password password)))

;; 3. Main Function to Handle the Sign-Up Process

(define users '()) ;; Initialize an empty list to store users

(define (sign-up)
  (display "Are you a Band or a Fan? (Enter 'band' or 'fan'): ")
  (define user-type (read-line))
  
  (cond
    [(string=? user-type "band")
     (define new-band (sign-up-band))
     (set! users (cons new-band users))
     (displayln (format "Band signed up: ~a" new-band))]
    
    [(string=? user-type "fan")
     (define new-fan (sign-up-fan))
     (set! users (cons new-fan users))
     (displayln (format "Fan signed up: ~a" new-fan))]
    
    [else (displayln "Invalid input. Please enter 'band' or 'fan'.")]))
  
;; 4. Run the Sign-Up Process and Test
(sign-up)

;; View all users (for testing purposes)
users
