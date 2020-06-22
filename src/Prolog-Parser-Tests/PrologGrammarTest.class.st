Class {
	#name : #PrologGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#category : #'Prolog-Parser-Tests'
}

{ #category : #private }
PrologGrammarTest >> expectedFailures [ 
	^ #( testTermComplexWithVariables )
]

{ #category : #accessing }
PrologGrammarTest >> parserClass [ 
	^ PrologGrammar 
]

{ #category : #'as yet unclassified' }
PrologGrammarTest >> prologSourceFamilyTree [
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

{ #category : #tests }
PrologGrammarTest >> testAtom [
	self 
    parse: 'male' 
    rule: #atom
]

{ #category : #tests }
PrologGrammarTest >> testAtomInvalid [
	self 
    fail: 'male(daniel).' 
    rule: #atom
]

{ #category : #tests }
PrologGrammarTest >> testAtomSpecial [
	self 
    parse: '\+' 
    rule: #atom
]

{ #category : #tests }
PrologGrammarTest >> testCallable [
	self 
		parse: 'member(X, A)'
		rule: #callable
]

{ #category : #tests }
PrologGrammarTest >> testCallableList [
	self 
    parse: 'member(X, A),
	isList(A)'
	rule: #termList
]

{ #category : #tests }
PrologGrammarTest >> testClauseList [
	self 
    parse: 'male(bob).
male(fred).

female(cynthia).
female(alica).

parent(cynthia, fred).
parent(bob, fred).

father(F,C) :- male(F), parent(F,C).'
	rule: #clauseList
]

{ #category : #tests }
PrologGrammarTest >> testClauseSimple [
	self 
    parse: 'male(bob).' 
    rule: #clause
]

{ #category : #tests }
PrologGrammarTest >> testClauseWithNeckOperator [
	self 
    parse: 'father(F,C) :- male(F), parent(F,C).'
    rule: #clause
]

{ #category : #tests }
PrologGrammarTest >> testInfixOperatorIs [
	self 
    parse: 'X is 3 + 4' 
    rule: #infixCompoundTerm
]

{ #category : #tests }
PrologGrammarTest >> testParseFamilyTree [
	self 
    parse: self prologSourceFamilyTree 
    rule: #knowledgeBase 
]

{ #category : #tests }
PrologGrammarTest >> testPredicate [
	self 
    parse: 'male(bob)' 
    rule: #callable
]

{ #category : #tests }
PrologGrammarTest >> testTermAtom [
	self 
    parse: 'male' 
    rule: #term
]

{ #category : #tests }
PrologGrammarTest >> testTermComplexOnlyAtoms [
	self 
    parse: 'func(foo(bar))' 
    rule: #callable
]

{ #category : #tests }
PrologGrammarTest >> testTermComplexWithVariables [
	self 
    parse: 'func(foo(Var1-Var2))' 
    rule: #structure
]

{ #category : #tests }
PrologGrammarTest >> testTermNumber [
	self 
    parse: '13' 
    rule: #term
]

{ #category : #tests }
PrologGrammarTest >> testTermVariable [
	self 
    parse: 'Var1' 
    rule: #term
]

{ #category : #tests }
PrologGrammarTest >> testVariable [
	self 
    parse: 'Var1' 
    rule: #variable
]

{ #category : #tests }
PrologGrammarTest >> testVariableOneLetter [
	self 
    parse: 'X' 
    rule: #variable
]
