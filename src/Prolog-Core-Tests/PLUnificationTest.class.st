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
	self deny: (#foo asPLAtom unify: #bar asPLAtom)
]

{ #category : #tests }
PLUnificationTest >> testAtom_AtomSame [
	self assert: (#foo asPLAtom unify: #foo asPLAtom)
]

{ #category : #tests }
PLUnificationTest >> testAtom_Number [
	self deny: (#foo asPLAtom unify: 1234 asPLAtom)
]

{ #category : #tests }
PLUnificationTest >> testNumber_Atom [
	self deny: (1234 asPLAtom unify: #foo asPLAtom)
]

{ #category : #tests }
PLUnificationTest >> testVariableDifferent_Atom [
	self deny: ((self variable: 'foo' value: #bar asPLAtom) unify: #baz asPLAtom)  
]

{ #category : #tests }
PLUnificationTest >> testVariableDifferent_Number [
	self deny: ((self variable: 'foo' value: 123 asPLAtom) unify: 321 asPLAtom)  
]

{ #category : #tests }
PLUnificationTest >> testVariableEmpty_Atom [
	self assert: ((self variable: 'foo') unify: #baz asPLAtom)  
]

{ #category : #tests }
PLUnificationTest >> testVariableEmpty_Number [
	self assert: ((self variable: 'foo') unify: 123 asPLAtom)  
]

{ #category : #tests }
PLUnificationTest >> testVariableSame_Atom [
	self assert: ((self variable: 'foo' value: #bar asPLAtom) unify: #bar asPLAtom)  
]

{ #category : #tests }
PLUnificationTest >> testVariableSame_Number [
	self assert: ((self variable: 'foo' value: 123 asPLAtom) unify: 123 asPLAtom)  
]

{ #category : #tests }
PLUnificationTest >> variable: name [
	^ PLVariable named: name
]

{ #category : #tests }
PLUnificationTest >> variable: name value: value [
	^ (PLVariable named: name) setValue: value
]
