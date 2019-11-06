(define
	(domain paczki)
	(:requirements :adl)
	(:predicates
		(na ?x ?y)
		(na-podlodze ?x)
		(w-chwytaku ?x)
	)
	; opuść paczkę na podłogę
	(:action opusc-na-podloge
		:parameters (?x)
		:precondition
		(
		    w-chwytaku ?x
		)
		:effect
		(and
			(not (w-chwytaku ?x))
			(na-podlodze ?x)
		)
	)
	; opuść paczkę na inną paczkę
	(:action opusc-na-paczke
		:parameters (?x ?y)
		:precondition
		(and
			(w-chwytaku ?x)
			(not (= ?x ?y))
			(not (w-chwytaku ?y))
			(not (exists (?z) (na ?z ?y)))
		)
		:effect
		(and
			(na ?x ?y)
			(not (w-chwytaku ?x))
		)
	)
	;podnieś paczkę z podłogi
	(:action podnies-z-podlogi
		:parameters (?x)
		:precondition
		(and
		    (not(exists(?z)(w-chwytaku ?z)))
			(na-podlodze ?x)
			(not(exists(?z)(na ?z ?x)))
		)
		:effect
		(and
			(w-chwytaku ?x)
			(not(na-podlodze ?x))
		)
	)
	;podnieś paczkę z innej paczki
	(:action podnies-z-paczki
		:parameters (?x ?y)
		:precondition
		(and
		    (not(exists(?z)(w-chwytaku ?z)))
			(not(= ?x ?y))
			(na ?x ?y)
			(not(exists(?z)(na ?z ?x)))
		)
		:effect
		(and
			(not(na ?x ?y))
			(w-chwytaku ?x)
		)
	)
)