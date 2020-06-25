Class {
	#name : #PLNamedVariable,
	#superclass : #PLVariable,
	#instVars : [
		'name',
		'reference'
	],
	#category : #'Prolog-Core-Model'
}

{ #category : #'as yet unclassified' }
PLNamedVariable class >> named: aString [ 
	^ self new 
		name: aString
]

{ #category : #testing }
PLNamedVariable >> isGrounded [
	^ self value notNil
]

{ #category : #accessing }
PLNamedVariable >> name: aString [ 
	name := aString
]

{ #category : #testing }
PLNamedVariable >> notGrounded [
	^ self isGrounded not
]

{ #category : #printing }
PLNamedVariable >> printOn: aStream [
	aStream << name
]

{ #category : #'as yet unclassified' }
PLNamedVariable >> setValue: aTerm [
	self myCallContext variableAt: name put: aTerm
]

{ #category : #'as yet unclassified' }
PLNamedVariable >> unifiesWithAtom: aPLAtom [ 
	self isGrounded 
		ifTrue: [ 
			(self value unifiesWithAtom: aPLAtom) ifFalse: [ 
				^ false ] ]
		ifFalse: [ self setValue: aPLAtom ].
	^ true 
]

{ #category : #'as yet unclassified' }
PLNamedVariable >> unifiesWithList: aPLList [ 
	^ self unify: aPLList 
]

{ #category : #'as yet unclassified' }
PLNamedVariable >> unifiesWithNumber: aNumber [ 
	^ self unify: aNumber
]

{ #category : #'as yet unclassified' }
PLNamedVariable >> unifiesWithTerm: aTerm [ 
	^ aTerm unifiesWithVariable: self 
]

{ #category : #'as yet unclassified' }
PLNamedVariable >> unifiesWithVariable: aPLVariable [ 
	(self isGrounded & aPLVariable isGrounded) ifTrue: [ 
		self halt ].
	aPLVariable isGrounded ifTrue: [ 
		self setValue: aPLVariable value ].
	self isGrounded ifTrue: [ 
		aPLVariable unifyValue: self value ].
	
	
]

{ #category : #'as yet unclassified' }
PLNamedVariable >> unify: aTerm [ 
	self isGrounded 
		ifTrue: [ 
			(self value unifiesWithTerm: aTerm) ifFalse: [ 
				^ false ] ]
		ifFalse: [ self setValue: aTerm ].
	^ true 
]

{ #category : #evaluating }
PLNamedVariable >> value [
	^ self myCallContext variableAt: name 
]
