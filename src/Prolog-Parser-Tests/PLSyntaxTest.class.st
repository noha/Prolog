Class {
	#name : #PLSyntaxTest,
	#superclass : #PP2CompositeNodeTest,
	#category : #'Prolog-Parser-Tests'
}

{ #category : #'as yet unclassified' }
PLSyntaxTest >> prologSourceFamilyTree [
	^ 'male(norbert).
male(daniel).
male(roger).
male(ludwig).
male(winfried).

female(andrea).
female(kerstin).
female(luzi).
female(franziska).

parent(kerstin, luzi).
parent(norbert, luzi).
parent(andrea, daniel).
parent(andrea, bianca).
parent(franziska, norbert).
parent(franziska, roger).
parent(franziska, andrea).
parent(ludwig, norbert).
parent(ludwig, andrea).
parent(ludwig, roger).
parent(sefi, kerstin).
parent(winfried, kerstin).
parent(klaus, daniel).
parent(klaus, bianca).

father(F,C) :- male(F), parent(F,C).
mother(M,C) :- female(M), parent(M,C).
'
]
