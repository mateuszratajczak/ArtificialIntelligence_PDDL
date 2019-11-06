(define
	(domain istambul)
	(:requirements :adl)
	(:predicates
	    (kupiec ?pole)
	    (pole ?pole)
	    (pomocnik ?pole ?nr)
	    (pom ?pomocnik)
	    (pomocnik-z-nami ?nr)
	    (sasiaduje ?pole ?pole)
	    (linia ?pole ?pole)
	    (przyprawy ?pole)
	    (owoce ?pole)
	    (tkanina ?pole)
	    (czarny-rynek ?pole)
	    (targowisko ?pole)
	    (kawa ?nazwa)
	    (fontanna ?pole)
	    (palac ?pole)
	    (rubin ?nr)
	    (wozek ?co ?nazwa)
	    (ilosc-owoce ?ile)
	    (ilosc-tkanin ?ile)
	    (ilosc-przypraw ?ile)
	    (succ ?ilosc ?ilosc)
	    (ilosc-kawy ?ilosc)
	)
	(:action idz-do-f
	    :parameters (?skad ?dokad ?l1 ?l2)
		:precondition
		(and
		    (kupiec ?skad)
		    (not (= ?skad ?dokad))
		    (= ?dokad f)
		    (pole ?l1)
		    (pole ?l2)
		    (pomocnik ?l1 p1)
		    (pomocnik ?l2 p2)
		)
		:effect
		(and
			(not (kupiec ?skad))
			(kupiec ?dokad)
			(pomocnik-z-nami p1)
			(pomocnik-z-nami p2)
			(not (pomocnik ?l1 p1))
			(not (pomocnik ?l2 p2))
		)
	)
	(:action idz-jeden-pomocnik-jest
		:parameters (?skad ?dokad ?pom)
		:precondition
		(and
		    (kupiec ?skad)
		    (not (= ?skad ?dokad))
		    (sasiaduje ?skad ?dokad)
		    (pomocnik ?dokad ?pom)
		    (pom ?pom)
		)
		:effect
		(and
			(not (kupiec ?skad))
			(kupiec ?dokad)
			(pomocnik-z-nami ?pom)
			(not (pomocnik ?dokad ?pom))
		)
	)
	(:action idz-jeden-pomocnik-brak
    	:parameters (?skad ?dokad ?pom)
    	:precondition
    	(and
    	    (kupiec ?skad)
    	    (not (= ?skad ?dokad))
    	    (sasiaduje ?skad ?dokad)
    	    (not (exists (?x) (pomocnik ?dokad ?x)))
    	    (pomocnik-z-nami ?pom)
    	    (pom ?pom)
    	)
    	:effect
    	(and
    		(not (kupiec ?skad))
    		(kupiec ?dokad)
    		(when 
    	        (not (= ?dokad f))
    	         (and 	(pomocnik ?dokad ?pom) (not (pomocnik-z-nami ?pom)) )
    	    )
    	)
	)
	(:action idz-dwa-pomocnik-jest
		:parameters (?skad ?dokad ?pom)
		:precondition
		(and
		    (kupiec ?skad)
		    (not (= ?skad ?dokad))
		    (linia ?skad ?dokad)
		    (pomocnik ?dokad ?pom)
		    (pom ?pom)
		)
		:effect
		(and
			(not (kupiec ?skad))
			(kupiec ?dokad)
			(pomocnik-z-nami ?pom)
			(not (pomocnik ?dokad ?pom))
		)
	)
	(:action idz-dwa-pomocnik-brak
    	:parameters (?skad ?dokad ?pom)
    	:precondition
    	(and
    	    (kupiec ?skad)
    	    (not (= ?skad ?dokad))
    	    (linia ?skad ?dokad)
    	    (not (exists (?x) (pomocnik ?dokad ?x)))
    	    (pomocnik-z-nami ?pom)
    	    (pom ?pom)
    	)
    	:effect
    	(and
    		(not (kupiec ?skad))
    		(kupiec ?dokad)
    		(when 
    	        (not (= ?dokad f))
    	         (and 	(pomocnik ?dokad ?pom) (not (pomocnik-z-nami ?pom)) )
    	    )
    	)
	)
	(:action wez-przyprawe
    	:parameters (?ilosc)
    	:precondition
    	(and
    	    (kupiec sp)
    	    (ilosc-przypraw ?ilosc)
    	    (succ ?ilosc v3)
    	)
    	:effect
    	(and
    		(when 
        		(= ?ilosc v0) 
        		(and (not (ilosc-przypraw ?ilosc)) (ilosc-przypraw v3) (wozek przyprawy v1) (wozek przyprawy v2) (wozek przyprawy v3))
        	)
        	(when 
        		(= ?ilosc v1) 
        		(and (not (ilosc-przypraw ?ilosc)) (ilosc-przypraw v3) (wozek przyprawy v2) (wozek przyprawy v3))
        	)
        	(when 
        		(= ?ilosc v2) 
        		(and (not (ilosc-przypraw ?ilosc)) (ilosc-przypraw v3) (wozek przyprawy v3))
        	)
    	)
	);wez-przyprawe
	(:action wez-cr
    	:parameters (?ilosc-przypraw ?ilosc-owoce ?ilosc-tkanin)
    	:precondition
    	(and
    	    (kupiec cr)
    	    (ilosc-przypraw ?ilosc-przypraw)
    	    (succ ?ilosc-przypraw v3)
    	    (ilosc-owoce ?ilosc-owoce)
    	    (succ ?ilosc-owoce v3)
    	    (ilosc-tkanin ?ilosc-tkanin)
    	    (succ ?ilosc-tkanin v3)
    	)
    	:effect
    	(and
    		(when 
        		(= ?ilosc-przypraw v0) 
        		(and (not (ilosc-przypraw ?ilosc-przypraw)) (ilosc-przypraw v1) (wozek przyprawy v1))
        	)
        	(when 
        		(= ?ilosc-przypraw v1) 
        		(and (not (ilosc-przypraw ?ilosc-przypraw)) (ilosc-przypraw v2) (wozek przyprawy v2))
        	)
        	(when 
        		(= ?ilosc-przypraw v2) 
        		(and (not (ilosc-przypraw ?ilosc-przypraw)) (ilosc-przypraw v3) (wozek przyprawy v3))
        	)
        	(when 
        		(= ?ilosc-owoce v0) 
        		(and (not (ilosc-owoce ?ilosc-owoce)) (ilosc-owoce v1) (wozek owoce v1))
        	)
        	(when 
        		(= ?ilosc-owoce v1) 
        		(and (not (ilosc-owoce ?ilosc-owoce)) (ilosc-owoce v2) (wozek owoce v2))
        	)
        	(when 
        		(= ?ilosc-owoce v2) 
        		(and (not (ilosc-owoce ?ilosc-owoce)) (ilosc-owoce v3) (wozek owoce v3))
        	)
        	(when 
        		(= ?ilosc-tkanin v0) 
        		(and (not (ilosc-tkanin ?ilosc-tkanin)) (ilosc-tkanin v1) (wozek tkanina v1))
        	)
        	(when 
        		(= ?ilosc-tkanin v1) 
        		(and (not (ilosc-tkanin ?ilosc-tkanin)) (ilosc-tkanin v2) (wozek tkanina v2))
        	)
        	(when 
        		(= ?ilosc-tkanin v2) 
        		(and (not (ilosc-tkanin ?ilosc-tkanin)) (ilosc-tkanin v3) (wozek tkanina v3))
        	)
    	)
	);wez-przyprawe
	(:action wez-owoc
    	:parameters (?ilosc)
    	:precondition
    	(and
    	    (kupiec so)
    	    (ilosc-owoce ?ilosc)
    	    (succ ?ilosc v3)
    	)
    	:effect
    	(and
    		(when 
        		(= ?ilosc v0) 
        		(and (not (ilosc-owoce ?ilosc)) (ilosc-owoce v3) (wozek owoce v1) (wozek owoce v2) (wozek owoce v3))
        	)
        	(when 
        		(= ?ilosc v1) 
        		(and (not (ilosc-owoce ?ilosc)) (ilosc-owoce v3) (wozek owoce v2) (wozek owoce v3))
        	)
        	(when 
        		(= ?ilosc v2) 
        		(and (not (ilosc-owoce ?ilosc)) (ilosc-owoce v3) (wozek owoce v3))
        	)
    	)
	);wez-owoc
	(:action wez-tkanina
    	:parameters (?ilosc)
    	:precondition
    	(and
    	    (kupiec so)
    	    (ilosc-tkanin ?ilosc)
    	    (succ ?ilosc v3)
    	)
    	:effect
    	(and
    		(when 
        		(= ?ilosc v0) 
        		(and (not (ilosc-tkanin ?ilosc)) (ilosc-tkanin v3) (wozek tkanina v1) (wozek tkanina v2) (wozek tkanina v3) )
        	)
        	(when 
        		(= ?ilosc v1) 
        		(and (not (ilosc-tkanin ?ilosc)) (ilosc-tkanin v3) (wozek tkanina v2)  (wozek tkanina v3))
        	)
        	(when 
        		(= ?ilosc v2) 
        		(and (not (ilosc-tkanin ?ilosc)) (ilosc-tkanin v3) (wozek tkanina v3))
        	)
    	)
	);wez-tkanina
	(:action sprzedaj-przyprawy
    	:parameters (?ilosc-kawy)
    	:precondition
    	(and
    	    (kupiec t)
    	    (wozek przyprawy v1)
    	    (wozek przyprawy v2)
    	    (wozek przyprawy v3)
    	    (ilosc-kawy ?ilosc-kawy)
    	)
    	:effect
    	(and
    	    (not (wozek przyprawy v1))
    	    (not (wozek przyprawy v2))
    	    (not (wozek przyprawy v3))
    	    (not (ilosc-przypraw v3))
    	    (ilosc-przypraw v0)
    	    (when 
        		(= ?ilosc-kawy v0) 
        		(and (not (ilosc-kawy ?ilosc-kawy)) (ilosc-kawy v1) (wozek kawa v2))
        	)
        	(when 
        		(= ?ilosc-kawy v1) 
        		(and (not (ilosc-kawy ?ilosc-kawy)) (ilosc-kawy v2) (wozek kawa v2))
        	)
    	)
	);sprzedaj-przyprawy
	(:action sprzedaj-tkaniny
    	:parameters (?ilosc-kawy)
    	:precondition
    	(and
    	    (kupiec t)
    	    (wozek tkanina v1)
    	    (wozek tkanina v2)
    	    (wozek tkanina v3)
    	    (ilosc-kawy ?ilosc-kawy)
    	)
    	:effect
    	(and
    	    (not (wozek tkanina v1))
    	    (not (wozek tkanina v2))
    	    (not (wozek tkanina v3))
    	    (not (ilosc-tkanin v3))
    	    (ilosc-tkanin v0)
    	    (when 
        		(= ?ilosc-kawy v0) 
        		(and (not (ilosc-kawy ?ilosc-kawy)) (ilosc-kawy v1) (wozek kawa v1))
        	)
        	(when 
        		(= ?ilosc-kawy v1) 
        		(and (not (ilosc-kawy ?ilosc-kawy)) (ilosc-kawy v2) (wozek kawa v2))
        	)
    	)
	);sprzedaj-tkaniny
	(:action sprzedaj-owoce
    	:parameters (?ilosc-kawy)
    	:precondition
    	(and
    	    (kupiec t)
    	    (wozek owoce v1)
    	    (wozek owoce v2)
    	    (wozek owoce v3)
    	    (ilosc-kawy ?ilosc-kawy)
    	)
    	:effect
    	(and
    	    (not (wozek owoce v1))
    	    (not (wozek owoce v2))
    	    (not (wozek owoce v3))
    	    (not (ilosc-owoce v3))
    	    (ilosc-owoce v0)
    	    (when 
        		(= ?ilosc-kawy v0) 
        		(and (not (ilosc-kawy ?ilosc-kawy)) (ilosc-kawy v1) (wozek kawa v1))
        	)
        	(when 
        		(= ?ilosc-kawy v1) 
        		(and (not (ilosc-kawy ?ilosc-kawy)) (ilosc-kawy v2) (wozek kawa v2))
        	)
    	)
	);sprzedaj-przyprawy
	(:action u-sultana
    	:precondition
    	(and
    	    (kupiec ps)
    	    (wozek kawa v1)
    	    (wozek kawa v2)
    	    ;(wozek przyprawy v1)
    	    ;(wozek owoce v1)
    	    (exists (?x) (wozek przyprawy ?x))
    	    (exists (?x) (wozek owoce ?x))
    	    (exists (?x) (wozek tkanina ?x))
    	)
    	:effect
    	(and
    	    (wozek rubin v1)
    	)
	);sprzedaj-przyprawy
)