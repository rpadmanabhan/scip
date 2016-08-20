;;; Program for counting change given an amount and discrete 
;;; change values 


;;; Wrapper to call our main program , assume we have 5 kinds 
;;; of coins 

(define (count-change amount)
  (cc amount 5))


;;; Function to do the actual work, takes in amount and 
;;; the kinds of coins , checks the base recursion conditions
;;; and returns appropriate values, or else defines the recurisve call
;;; such that we sum : 
;;;                  the number of ways to change the amount using all but the first kind of coin
;;;              and the number if ways to change amount - denomination of the first kind of coin

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
	((or (< amount 0) (= kinds-of-coins 0)) 0)
	((else (+ (cc amount 
		      (- kinds-of-coins 1))
		  (cc (- amount
			 (first-denomination kinds-of-coins))
		      kinds-of-coins))))))


;;; Function to define the actual coin denominations 

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
	((= kinds-of-coins 2) 5)
	((= kinds-of-coins 3) 10)
	((= kinds-of-coins 4) 25)
	((= kinds-of-coins 5) 50)))
