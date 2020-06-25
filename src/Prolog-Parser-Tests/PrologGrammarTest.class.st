Class {
	#name : #PrologGrammarTest,
	#superclass : #PLSyntaxTest,
	#category : #'Prolog-Parser-Tests'
}

{ #category : #private }
PrologGrammarTest >> expectedFailures [ 
	^ #( testTermComplexWithVariables)
]

{ #category : #accessing }
PrologGrammarTest >> parserClass [ 
	^ PrologGrammar 
]

{ #category : #tests }
PrologGrammarTest >> testAtomEmptyList [
	self 
    parse: '[]' 
    rule: #atom
]

{ #category : #tests }
PrologGrammarTest >> testAtomInvalid [
	self 
    fail: 'male(daniel).' 
    rule: #atom
]

{ #category : #tests }
PrologGrammarTest >> testAtomQuotedSpaces [
	self 
    parse: '''some atom''' 
    rule: #atom
]

{ #category : #tests }
PrologGrammarTest >> testAtomQuotedUppercase [
	self 
    parse: '''Taco''' 
    rule: #atom
]

{ #category : #tests }
PrologGrammarTest >> testAtomSingleCharacter [
	self 
    parse: 'x' 
    rule: #atom
]

{ #category : #tests }
PrologGrammarTest >> testAtomWord [
	self 
    parse: 'male' 
    rule: #atom
]

{ #category : #tests }
PrologGrammarTest >> testCallable [
	self 
		parse: 'member(X, A)'
		rule: #callable
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
PrologGrammarTest >> testFact [
	self 
    parse: 'father(F,C)' 
    rule: #fact
]

{ #category : #tests }
PrologGrammarTest >> testHoleList [
	self 
    parse: '[H|T]' 
    rule: #holeList
]

{ #category : #tests }
PrologGrammarTest >> testInfixOperatorIs [
	self 
    parse: 'X is 3 + 4' 
    rule: #infixCompoundTerm
]

{ #category : #tests }
PrologGrammarTest >> testNumberFloat [
	self 
    parse: '1.234' 
    rule: #number
]

{ #category : #tests }
PrologGrammarTest >> testNumberInteger [
	self 
    parse: '1234' 
    rule: #number
]

{ #category : #tests }
PrologGrammarTest >> testParseFamilyTree [
	self 
    parse: self prologSourceFamilyTree 
    rule: #knowledgeBase 
]

{ #category : #tests }
PrologGrammarTest >> testPrefixCompoundTerm [
	self 
    parse: 'male(bob)' 
    rule: #prefixCompoundTerm 
]

{ #category : #tests }
PrologGrammarTest >> testRule [
	self 
    parse: 'father(F,C) :- male(F), parent(F,C)' 
    rule: #rule
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
PrologGrammarTest >> testTermList [
	self 
    parse: 'member(X, A),
	isList(A)'
	rule: #termList
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
PrologGrammarTest >> testVariableAnonymous [
	self 
    parse: '_' 
    rule: #variable
]

{ #category : #tests }
PrologGrammarTest >> testVariableDefault [
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

{ #category : #tests }
PrologGrammarTest >> testVariableStartsWithUnderscore [
	self 
    parse: '_small' 
    rule: #variable
]
