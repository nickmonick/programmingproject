#lang racket
;ali alaskari programming project code for requirments 1.1,1.2,2.1 and 2.2
;requirments 1.1 and 1.2
; Function to create a Band (using lists)
(define (sign-up-band);creates a function called sign-up-band
  (display " please enter Band Name");questions asking user to enter band name
  (define band-name (read-line));think of read line as a function that waits for the user to type something, then hit enter to enter the writing, for example this piece of code will prompt out a question asking enter band name, the read line will just allow users to answer the question
  (display " please enter Band Email")
  (define email (read-line));just prompts a text box for users to answer with the question enter band email
  (display "please enter Band Phone Number");prompts a text box for users to answer with the question enter band phone number
  (define phone (read-line))
  (display "please enter Band Password");prompts a text box for users to answer, with the question enter band password
  (define password (read-line))
  
;create and return band as a list of key value pairs :key value pairs are just of representing data in association to a key, for example think of key value pairs to have a specific key with a corresponding to value, for example a name could be a key with alice being the associated value 
  (list(cons 'type 'band) ;'type is the type of user (band or fan)
        (cons 'band-name band-name);'band name is the key and band name is the value 
        (cons 'email email);'email is the key and email is the value
        (cons 'phone phone);'phone is the key and phone is the value 
        (cons 'password password)));'password is the key and password is the value
;to put it simply key-value pairs are just a way of associating a value to a key

;Function to create a Fan (using lists)
(define (sign-up-fan)
  (display "please enter Username" )
  (define username (read-line));prompts a text box asking users for answer to the question enter username
  
  (display "please enter Fan Email")
  (define email (read-line));prompts a text box asking users for answer to the question enter fan email
  
  (display " please enter Fan Phone Number");prompts a text box asking users for answer to the question enter fan phone number
  (define phone (read-line))
  
  (display "please enter Date of Birth (YYYY-MM-DD)");prompts a text box asking users for answer to the question enter  date of birth
  (define dob (read-line))
  
  (display " please Fan Password");prompts a text box asking users for answer to the question enter fan password
  (define password (read-line))
  
; Create and return Fan info as a list of key-value pairs
  (list (cons 'type 'fan);'type is the type of user, fan is the value of that key
        (cons 'username username);'username is the key, username is the value to that key
        (cons 'email email);'email is the key, email is the value of that key
        (cons 'phone phone);'phone is the key, phone is the value to that key
        (cons 'date-of-birth dob);'date of birth is the key, dob is the value to that key
        (cons 'password password)));'password is the key, password is the value to that key

;Main Function for the Sign-Up Process
(define users '()); create an empty list to store users

(define (sign-up);function called sign up
  (display "are you a band or a fan? (please enter fan or band)");question asking users wheather they are fan or band
  (define user-type (read-line));function that reads user type
  
  (cond;checks wheather the user wants to be a band or a fan;
    [(string=? user-type "band")
     (define new-band (sign-up-band))
     (set! users (cons new-band users))
     (displayln (format "Band signed up, (if you want to create another account please type (sign-up) down below, and if you want to create a concert listing then please type (create-concert): ~a" new-band))];if user enters band then the cond statment calls the sign-up band function to create a new band
 ;then it saves the new band in the users list by adding it to the front, as shown by the code (set! users (cons new-band users)), after that a confirmation message with the band details pops up as shown by band signed up
    [(string=? user-type "fan")
     (define new-fan (sign-up-fan))
     (set! users (cons new-fan users))
     (displayln (format "Fan signed up ~a (if you want to create another account please type (sign-up) down below" new-fan))];if user enters fan then the sign-up fan function is called and a new fan is created, it gets saved in the users list as shown by the code (set! users (cons new-fan users)), after that a confirmation message is shown with the fan details as shown by the code (displayln (format "Fan signed up: ~a"
    [else (displayln "Invalid input. Please enter 'band' or 'fan'.")]));if band or fan arent inputted then it will give error message
;Run the Sign-Up Process and Test
(sign-up)

;View all users (for testing purposes)
users

;requirments 2.1 and 2.2
;Define a List to Store Concert Listings
(define concert-listings '()) ; Empty list to store all concert listings


;Function to Create a Concert Listing
(define (create-concert);creates a function called create-concert
  (display " please enter Band Name: ")
  (define band-name (read-line)) ; Reads band name from the user
  
  (display "please enter Date  (example,2024-12-15):")
  (define date-time (read-line)) ; Reads date and time
   (display "please enter time (example ,19:00):")
  (define time (read-line)) ; Reads  time
  (display "please enter Venue: ")
  (define venue (read-line));Reads venue
  
  (display "please enter Cost: ")
  (define cost (read-line)); Reads cost as a string
  
  ; Create a concert listing as a list of key-value pairs
  (define concert
(list (cons 'band-name band-name);'band-name is the key and band-name is the value to that key, cons adds the key value pair to the front of the list
(cons 'date-time date-time);'date-time is the key and date-time is the value to that key, cons just adds the key-value pair to the list
(cons 'venue venue);'venue is the key and venue is the value to that key, cons adds the key value pair to the list
(cons 'cost cost)));'cost is the key and cost is the value to that pair, cons adds the key value pair to the front of the list
;Adds the new concert listing to the list
(set! concert-listings (cons concert concert-listings));function to update concert-listings by adding a new concert to a existing list of concerts, set! updatdes the concert listing to the result of the cons operation
  
;Confirm the concert has been created
(displayln "Concert listing created successfully!")
concert);confirmation message after concert gets made
;function to view concert listings
(define (view-concerts);defines function called view listings
(if (null? concert-listings);if concert listing is empty 
(displayln "No concert listings available.");then display "no concert listings available
(for-each (lambda (concert)
                  (displayln concert))
                concert-listings)));for-each goes through every item in the list one by one and does something with every item,
;lambda (concert) (displayln concert)=lambda creates a anonymous function, takes concert and prints it using the displayln function,displayln just prints something to the screen
;concert-listings is the name of the list, it contains information of the concerts made

;(create-concert)  allows bands to create a concert
;(view-concerts) allows user to view createrd concerts


;2.3 & 2.4
(define (edit-concert-listing band-name field-type new-value)
  (define (update-field concert-list field-type new-value)
    (cond
      [(empty? concert-list) 
         '()]
      [(equal? (car (car concert-list)) field-type) 
         (cons (cons field-type new-value) (cdr concert-list))]
      [else 
         (cons (car concert-list) (update-field (cdr concert-list) field-type new-value))]))

  (cond
    [(empty? concert-listings) 
       #f] 
    [(equal? (cdr (assoc 'band-name (car concert-listings))) band-name)
       (set! concert-listings 
             (cons (update-field (car concert-listings) field-type new-value) 
                   (cdr concert-listings)))] 
       (values concert-listings) ; Return the updated list
    [else 
       (edit-concert-listing band-name field-type new-value)]) ; Recursively search the rest of the list
  )

; 4. Test the Functions
;(create-concert) ; allows the band to create a concert
;(view-concerts)  ; views all created concerts

(define favourite-concerts '(((band-name . "bob") (date-time . 2024) (venue . "bobb") (cost . 100))
    ((band-name . "joe") (date-time . 2025) (venue . joee) (cost . 200))
    ((band-name . "doe") (date-time . 2023) (venue . bbbb) (cost . 300))))
;3.3
(define (view-favourites)
  (if (null? favourite-concerts)
      (displayln "No favourite concerts found" )
      (for-each (lambda (favourite)
                  (displayln favourite))
                favourite-concerts)))

(define (remove-concert band-name)
  (set! favourite-concerts 
        (filter (lambda (concert)
                  (not (equal? (cdr (assoc 'band-name concert)) band-name))) 
                  favourite-concerts)))
  

(view-favourites)
(displayln "new:")
(remove-concert "bob")
(view-favourites)

  


