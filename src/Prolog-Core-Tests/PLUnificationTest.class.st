Class {
	#name : #PLUnificationTest,
	#superclass : #PLTest,
	#category : #'Prolog-Core-Tests'
}

{ #category : #running }
PLUnificationTest >> newCallContext [
	^ PLSubCallContext new
]

{ #category : #running }
PLUnificationTest >> performTest [
	^ PLCurrentCallContext 
		value: self newCallContext
		during: [ super performTest ]
]

{ #category : #tests }
PLUnificationTest >> testAtom_AtomDifferent [
	self deny: (#foo asPLTerm unify: #bar asPLTerm)
]

{ #category : #tests }
PLUnificationTest >> testAtom_AtomSame [
	self assert: (#foo asPLTerm unify: #foo asPLTerm)
]

{ #category : #tests }
PLUnificationTest >> testAtom_Number [
	self deny: (#foo asPLTerm unify: 1234 asPLTerm)
]

{ #category : #tests }
PLUnificationTest >> testCompoundDifferent_OnlyAtoms [
	| compound compound2 |
	compound := PLCompoundTerm functor: #foo asPLTerm arguments: { #bar asPLTerm . 123 asPLTerm } asPLTerm.
	compound2 := PLCompoundTerm functor: #foo asPLTerm arguments: { #bar asPLTerm . 124 asPLTerm } asPLTerm.
	self deny: (compound unify: compound2).
]

{ #category : #tests }
PLUnificationTest >> testCompoundSame_OnlyAtoms [
	| compound |
	compound := PLCompoundTerm functor: #foo asPLTerm arguments: { #bar asPLTerm . 123 asPLTerm } asPLTerm.
	self assert: (compound unify: compound).
]

{ #category : #tests }
PLUnificationTest >> testListComma_CommaDifferent [
	| list list2 |
	list := { #bar asPLTerm . 123 asPLTerm } asPLTerm.
	list2 := { #bar asPLTerm . 124 asPLTerm } asPLTerm.
	self deny: (list unify: list2).
]

{ #category : #tests }
PLUnificationTest >> testListComma_CommaDifferentSize [
	| list list2 |
	list := { #bar asPLTerm . 123 asPLTerm . #foo asPLTerm } asPLTerm.
	list2 := { #bar asPLTerm . 124 asPLTerm } asPLTerm.
	self deny: (list unify: list2).
]

{ #category : #tests }
PLUnificationTest >> testListComma_CommaDifferentSizeOpposite [
	| list list2 |
	list := { #bar asPLTerm . 123 asPLTerm  } asPLTerm.
	list2 := { #bar asPLTerm . 124 asPLTerm . #foo asPLTerm} asPLTerm.
	self deny: (list unify: list2).
]

{ #category : #tests }
PLUnificationTest >> testListComma_CommaSame [
	| list list2 |
	list := { #bar asPLTerm . 123 asPLTerm } asPLTerm.
	list2 := { #bar asPLTerm . 123 asPLTerm } asPLTerm.
	self assert: (list unify: list2).
]

{ #category : #tests }
PLUnificationTest >> testNumber_Atom [
	self deny: (1234 asPLTerm unify: #foo asPLTerm)
]

{ #category : #tests }
PLUnificationTest >> testVariableDifferent_Atom [
	self deny: ((self variable: 'foo' value: #bar asPLTerm) unify: #baz asPLTerm)  
]

{ #category : #tests }
PLUnificationTest >> testVariableDifferent_Number [
	self deny: ((self variable: 'foo' value: 123 asPLTerm) unify: 321 asPLTerm)  
]

{ #category : #tests }
PLUnificationTest >> testVariableEmpty_Atom [
	self assert: ((self variable: 'foo') unify: #baz asPLTerm)  
]

{ #category : #tests }
PLUnificationTest >> testVariableEmpty_Number [
	self assert: ((self variable: 'foo') unify: 123 asPLTerm)  
]

{ #category : #tests }
PLUnificationTest >> testVariableSame_Atom [
	self assert: ((self variable: 'foo' value: #bar asPLTerm) unify: #bar asPLTerm)  
]

{ #category : #tests }
PLUnificationTest >> testVariableSame_Number [
	self assert: ((self variable: 'foo' value: 123 asPLTerm) unify: 123 asPLTerm)  
]

{ #category : #tests }
PLUnificationTest >> variable: name [
	^ PLVariable named: name
]

{ #category : #tests }
PLUnificationTest >> variable: name value: value [
	^ (PLVariable named: name) setValue: value
]
