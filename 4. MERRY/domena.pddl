(define
	(domain mary)
	(:requirements :adl)
	(:predicates
	    (pomieszczenie ?litera)
	    (kolorx ?kolor)
	    (ludek ?gdzie)
	    (kolor ?jaki ?gdzie ?nr)
	    (sasiaduje ?pom1 ?pom2 ?kolor)
	    (mam ?kolor ?nr)
	    (numer ?nr)
	    (klocek ?klocek)
	    (puste ?poz)
	    (pozycja ?klocek ?poz)
	    (obok ?poz1 ?poz2)
	    (poz ?poz1)
	)
	; opuść paczkę na podłogę
	(:action wez
		:parameters (?kolor ?skad ?nr)
		:precondition
		(and
		    (numer ?nr)
		    (kolorx ?kolor)
		    (pomieszczenie ?skad)
		    (kolor ?kolor ?skad ?nr)
		    (ludek ?skad)
		)
		:effect
		(and
			(mam ?kolor ?nr)
			(not (kolor ?kolor ?skad ?nr))
		)
	)
	(:action idz
		:parameters (?gdzie ?skad ?kolor ?nr)
		:precondition
		(and
		    (numer ?nr)
		    (kolorx ?kolor)
		    (pomieszczenie ?gdzie)
		    (pomieszczenie ?skad)
		    (ludek ?skad)
		    (sasiaduje ?skad ?gdzie ?kolor)
		    (not (= ?skad ?gdzie))
		    (mam ?kolor ?nr)
		    (not (exists (?x ?y) (kolor ?x ?skad ?y)))
		)
		:effect
		(and
			(not (mam ?kolor ?nr))
			(not (ludek ?skad))
			(ludek ?gdzie)
		)
	)
	(:action przesun
		:parameters (?klocek ?skad ?gdzie)
		:precondition
		(and
		    (ludek a)
		    (klocek ?klocek)
		    (poz ?skad)
		    (poz ?gdzie)
		    (not (= ?skad ?gdzie))
		    (puste ?gdzie)
		    (obok ?skad ?gdzie)
		    (pozycja ?klocek ?skad)
		)
		:effect
		(and
		    (pozycja ?klocek ?gdzie)
			(not (pozycja ?klocek ?skad))
			(not (puste ?gdzie))
			(puste ?skad)
		)
	)
)