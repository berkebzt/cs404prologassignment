%Pet detective problem

woman(beyza). woman(canan). woman(meryem).
man(gencer). man(can). man(rasim).

%deciding the people as man or woman.

person(X):- man(X).
person(X):- woman(X).

%one thing unique

uniq(A,B,C,D,E,F):- person(A), person(B), person(C), person(D), person(E), person(F), \+A=B, \+A=C, \+A=D, \+A=E, \+A=F, \+B=C, \+B=D, \+B=E, \+B=F, \+C=D, \+C=E, \+C=F, \+D=E, \+D=F, \+E=F.

%Output function

writeanswers(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    write("BlueBag: "), write(BlueBag), nl,
    write("OrangeBag: "), write(OrangeBag), nl,
    write("RedBag: "), write(RedBag), nl,
    write("PurpleBag: "), write(PurpleBag), nl,
    write("GreenBag: "), write(GreenBag), nl,
    write("YellowBag: "), write(YellowBag), nl, nl,
    
    write("Avocado: "), write(Avocado), nl,
    write("Onion: "), write(Onion), nl,
    write("Nuts: "), write(Nuts), nl,
    write("Chocolate: "), write(Chocolate), nl,
    write("Garlic: "), write(Garlic), nl,
    write("Cookies: "), write(Cookies), nl.

clu1_2(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    man(RedBag),
    \+Redbag=Cookies, \+Redbag=Chocolate, \+RedBag=Avocado, \+Redbag=Onion. %Clue1 And Clue2
clu3(BlueBag,OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    beyza=YellowBag, meryem=BlueBag.
clu3(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    beyza=BlueBag, meryem=YellowBag. %Clue3

clu4(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    \+beyza=Avocado, \+gencer=Avocado, 
    \+Avocado=BlueBag, \+Avocado=OrangeBag. %Clue4

clu5(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    woman(Cookies), Cookies=YellowBag. %Clue5

clu6(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    PurpleBag=can.
clu6(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    PurpleBag=gencer. %Clue6

clu7(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    \+Chocolate=OrangeBag. %Clue7

clu8(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    \+meryem=YellowBag, \+meryem=GreenBag. %Clue8

clu9(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    Onion=gencer. %Clue9

%Clue10 - Nuts were carried with GreenBag and that person was guilty.

thief(X):-
    
    uniq(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag),
    uniq(Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
    
    clu1_2(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
    clu3(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
    clu4(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
    clu5(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
    clu6(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
    clu7(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
    clu8(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
    clu9(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
    
    X = Nuts, X = GreenBag,
    
    write("Pet Thief is: "), write(X), nl, nl,
    
    writeanswers(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies).