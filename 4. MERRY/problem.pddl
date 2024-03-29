﻿(define (problem gsoko1a)
(:domain mary)
(:objects a b c d e f g h i zielony czerwony pomaranczowy rozowy niebieski x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 klocek1 klocek2 klocek3 klocek4 klocek5 klocek6 klocek7 klocek8 poz1 poz2 poz3 poz4 poz5 poz6 poz7 poz8 poz9)
(:init
        (numer x1)
        (numer x2)
        (numer x3)
        (numer x4)
        (numer x5)
        (numer x6)
        (numer x7)
        (numer x8)
        (numer x9)
        (numer x10)
        (numer x11)
        (numer x12)
        (numer x13)
        (numer x14)
        (kolorx zielony)
        (kolorx niebieski)
        (kolorx pomaranczowy)
        (kolorx rozowy)
        (kolorx czerwony)
        (pomieszczenie a)
        (pomieszczenie b)
        (pomieszczenie c)
        (pomieszczenie d)
        (pomieszczenie e)
        (pomieszczenie f)
        (pomieszczenie g)
        (pomieszczenie h)
        (pomieszczenie i)
        (ludek f)
        (kolor zielony a x1)
        (kolor zielony d x2)
        (kolor zielony e x3)
        (kolor zielony h x4)
        (kolor czerwony d x5)
        (kolor czerwony h x6)
        (kolor pomaranczowy c x7)
        (kolor pomaranczowy i x8)
        (kolor rozowy b x9)
        (kolor niebieski c x10)
        (kolor niebieski e x11)
        (kolor niebieski f x12)
        (kolor niebieski f x13)
        (kolor niebieski i x14) 
        (sasiaduje a b pomaranczowy)
        (sasiaduje b d pomaranczowy)
        (sasiaduje f g rozowy)
        (sasiaduje h i niebieski)
        (sasiaduje i h niebieski)
        (sasiaduje f i niebieski)
        (sasiaduje i f niebieski)
        (sasiaduje a c czerwony)
        (sasiaduje c a czerwony)
        (sasiaduje e h czerwony)
        (sasiaduje h e czerwony)
        (sasiaduje c e zielony)
        (sasiaduje e c zielony)
        (sasiaduje d f zielony)
        (sasiaduje f d zielony)
        (sasiaduje e f niebieski)
        (sasiaduje f e niebieski)
        (klocek klocek1)
        (klocek klocek2)
        (klocek klocek3)
        (klocek klocek4)
        (klocek klocek5)
        (klocek klocek6)
        (klocek klocek7)
        (klocek klocek8)
        (poz poz1)
        (poz poz2)
        (poz poz3)
        (poz poz4)
        (poz poz5)
        (poz poz6)
        (poz poz7)
        (poz poz8)
        (poz poz9)
        (pozycja klocek5 poz1)
        (pozycja klocek4 poz2)
        (pozycja klocek1 poz3)
        (pozycja klocek8 poz4)
        (pozycja klocek3 poz6)
        (pozycja klocek7 poz7)
        (pozycja klocek2 poz8)
        (pozycja klocek6 poz9)
        (puste poz5)
        (obok poz1 poz2)
        (obok poz1 poz4)
        (obok poz2 poz1)
        (obok poz2 poz3)
        (obok poz2 poz5)
        (obok poz3 poz2)
        (obok poz3 poz6)
        (obok poz4 poz1)
        (obok poz4 poz5)
        (obok poz4 poz7)
        (obok poz5 poz4)
        (obok poz5 poz2)
        (obok poz5 poz6)
        (obok poz5 poz8)
        (obok poz6 poz3)
        (obok poz6 poz9)
        (obok poz6 poz5)
        (obok poz7 poz4)
        (obok poz7 poz8)
        (obok poz8 poz7)
        (obok poz8 poz5)
        (obok poz8 poz9)
        (obok poz9 poz8)
        (obok poz9 poz6)
)
(:goal (and
       (ludek g)
       (pozycja klocek1 poz1)
       (pozycja klocek2 poz2)
       (pozycja klocek3 poz3)
       (pozycja klocek4 poz4)
       (pozycja klocek5 poz5)
       (pozycja klocek6 poz6)
       (pozycja klocek7 poz7)
       (pozycja klocek8 poz8)
))
)