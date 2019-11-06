(define (problem p1)
	(:domain paczki)
	(:objects a b c d e)
	(:init
    	(na-podlodze a)
    	(na-podlodze d)
    	(na b a)
    	(na c b)
    	(na e d)
	)
	(:goal
		(and
			(na d b)
			(exists(?x)(na b ?x))
		)
	)
)