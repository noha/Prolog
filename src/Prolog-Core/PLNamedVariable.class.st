Class {
	#name : #PLNamedVariable,
	#superclass : #PLVariable,
	#instVars : [
		'name',
		'reference'
	],
	#category : #'Prolog-Core-Model'
}

{ #category : #testing }
PLNamedVariable >> isGrounded [
	^ self value notNil
]

{ #category : #accessing }
PLNamedVariable >> name [
	^ name
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
PLNamedVariable >> unify: aTerm [ 
	^ aTerm unifyWithVariable: self 
]

{ #category : #'as yet unclassified' }
PLNamedVariable >> unifyValue: aTerm [ 
	self isGrounded 
		ifTrue: [ 
			(self value unify: aTerm) ifFalse: [ 
				^ false ] ]
		ifFalse: [ self setValue: aTerm ].
	^ true 
]

{ #category : #'as yet unclassified' }
PLNamedVariable >> unifyWithAtom: aPLAtom [ 
	self isGrounded 
		ifTrue: [ 
			(self value unifyWithAtom: aPLAtom) ifFalse: [ 
				^ false ] ]
		ifFalse: [ self setValue: aPLAtom ].
	^ true 
]

{ #category : #'as yet unclassified' }
PLNamedVariable >> unifyWithList: aPLList [ 
	^ self unifyValue: aPLList 
]

{ #category : #'as yet unclassified' }
PLNamedVariable >> unifyWithNumber: aNumber [ 
	^ self unifyValue: aNumber
]

{ #category : #'as yet unclassified' }
PLNamedVariable >> unifyWithVariable: aPLVariable [ 
	(self isGrounded & aPLVariable isGrounded) ifTrue: [ 
		self halt ].
	aPLVariable isGrounded ifTrue: [ 
		self setValue: aPLVariable value ].
	self isGrounded ifTrue: [ 
		aPLVariable unifyValue: self value ].
	
	
]

{ #category : #evaluating }
PLNamedVariable >> value [
	^ self myCallContext variableAt: name 
]
