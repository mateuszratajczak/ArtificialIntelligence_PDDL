(define
	(domain hanoi)
	(:requirements :adl)
	(:predicates
	    (palik ?palik)
	    (krazek ?krazek)
		(na-paliku ?krazek ?palik)
		(na-ziemi ?krazek)
		(na-krazku ?krazek_na ?krazek_pod)
		(mniejszy ?mniejszy ?wiekszy)
	)
	; opuść paczkę na podłogę
	(:action przesun-na-pusty
		:parameters (?z ?na ?krazek)
		:precondition
		(and
		    (palik ?z)
		    (palik ?na)
		    (krazek ?krazek)
		    (not (= ?z ?na))
		    (not (exists (?x) (na-paliku ?x ?na)))
		    (not (exists (?x) (na-krazku ?x ?krazek)))
		    (na-paliku ?krazek ?z)
		    
		)
		:effect
		(and
			(na-paliku ?krazek ?na)
			(not (na-paliku ?krazek ?z))
			(na-ziemi ?krazek)
			(forall (?x) (not (na-krazku ?krazek ?x)))
		)
	)
	(:action przesun
		:parameters (?z ?na ?krazek_na ?krazek_pod)
		:precondition
		(and
		    (palik ?z)
		    (palik ?na)
		    (krazek ?krazek_na)
		    (krazek ?krazek_pod)
		    (not (= ?z ?na))
		    (not (= ?krazek_na ?krazek_pod))
		    (not (exists (?x) (na-krazku ?x ?krazek_pod)))
		    (not (exists (?x) (na-krazku ?x ?krazek_na)))
		    (na-paliku ?krazek_na ?z)
		    (na-paliku ?krazek_pod ?na)
		    (mniejszy ?krazek_na ?krazek_pod )
		)
		:effect
		(and
			(na-paliku ?krazek_na ?na)
			(not (na-paliku ?krazek_na ?z))
			(forall (?x) (not (na-krazku ?krazek_na ?x)))
			(na-krazku ?krazek_na ?krazek_pod)
		)
	)
	
)