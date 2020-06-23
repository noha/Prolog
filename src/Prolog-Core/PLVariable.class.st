Class {
	#name : #PLVariable,
	#superclass : #PLTerm,
	#instVars : [
		'name',
		'reference',
		'parent'
	],
	#category : #'Prolog-Core'
}

{ #category : #testing }
PLVariable >> isGrounded [
	^ self value notNil
]

{ #category : #accessing }
PLVariable >> name: aString [ 
	name := aString
]

{ #category : #testing }
PLVariable >> notGrounded [
	^ self isGrounded not
]

{ #category : #'as yet unclassified' }
PLVariable >> parent [
	^ parent
]

{ #category : #'as yet unclassified' }
PLVariable >> parent: aTerm [
	parent := aTerm
]

{ #category : #printing }
PLVariable >> printOn: aStream [
	aStream << name
]

{ #category : #'as yet unclassified' }
PLVariable >> setValue: aTerm [
	self myCallContext variableAt: name put: aTerm
]

{ #category : #'as yet unclassified' }
PLVariable >> unifiesWithAtom: aPLAtom [ 
	self isGrounded 
		ifTrue: [ 
			(self value unifiesWithAtom: aPLAtom) ifFalse: [ 
				^ false ] ]
		ifFalse: [ self setValue: aPLAtom ].
	^ true 
]

{ #category : #'as yet unclassified' }
PLVariable >> unifiesWithTerm: aTerm [ 
	^ aTerm unifiesWithVariable: self 
]

{ #category : #'as yet unclassified' }
PLVariable >> unifiesWithVariable: aPLVariable [ 
	(self isGrounded & aPLVariable isGrounded) ifTrue: [ 
		self halt ].
	aPLVariable isGrounded ifTrue: [ 
		self setValue: aPLVariable value ].
	self isGrounded ifTrue: [ 
		aPLVariable unifyValue: self value ].
	
	
]

{ #category : #evaluating }
PLVariable >> value [
	^ self myCallContext variableAt: name 
]
