Class {
	#name : #PLVariable,
	#superclass : #PLTerm,
	#instVars : [
		'name',
		'reference'
	],
	#category : #'Prolog-Core'
}

{ #category : #testing }
PLVariable >> isGrounded [
	^ reference notNil
]

{ #category : #accessing }
PLVariable >> name: aString [ 
	name := aString
]

{ #category : #testing }
PLVariable >> notGrounded [
	^ self isGrounded not
]

{ #category : #printing }
PLVariable >> printOn: aStream [
	aStream << name
]

{ #category : #'as yet unclassified' }
PLVariable >> setValue: aTerm [
	self callContext variableAt: name put: aTerm
]

{ #category : #'as yet unclassified' }
PLVariable >> unifiesWithAtom: aPLAtom [ 
	self isGrounded 
		ifTrue: [ 
			(self value unifiesWithAtom: aPLAtom) ifFalse: [ 
				^ false ] ].
	self setValue: aPLAtom.
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
	^ self callContext variableAt: name 
]
