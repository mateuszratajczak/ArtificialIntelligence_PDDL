(define
	(domain sokoban)
	(:requirements :adl)
	(:predicates
		(paczka ?x)
		(cel ?x)
		(robot ?x)
		(poziomo ?x ?y)
		(pionowo ?x ?y)
	)
	; idz
	(:action idz
		:parameters (?skad ?dokad)
		:precondition
		(and
			(robot ?skad)
			(not(= ?skad ?dokad))
			(not(paczka ?dokad))
			(not (paczka ?skad))
			(or
			    (poziomo ?skad ?dokad)
			    (pionowo ?skad ?dokad)
			)
		)
		:effect
		(and 
			(robot ?dokad)
			(not (robot ?skad))
		)
	)
	; pchaj
	(:action pchaj
		:parameters (?robot ?skad ?dokad)
		:precondition
		(and
			(robot ?robot)
			(not(= ?robot ?skad))
			(not(= ?robot ?dokad))
			(not(= ?skad ?dokad))
			(or
			   (and
			    (poziomo ?robot ?skad)
			    (poziomo ?skad ?dokad)
			   )
			   (and
			    (pionowo ?robot ?skad)
			    (pionowo ?skad ?dokad)
			   )
			)
			(paczka ?skad)
			(not(paczka ?dokad))
		)
		:effect
		(and
		    (not (robot ?robot))
		    (robot ?skad)
		    (paczka ?dokad)
		    (not (paczka ?skad))
		)
	)
)