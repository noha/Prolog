Class {
	#name : #PLNumber,
	#superclass : #PLConstant,
	#instVars : [
		'value'
	],
	#category : #'Prolog-Core-Model'
}

{ #category : #'instance creation' }
PLNumber class >> value: anInteger [ 
	^ self new 
		value: anInteger
]

{ #category : #printing }
PLNumber >> printOn: aStream [
	aStream << value asString
]

{ #category : #unification }
PLNumber >> unifiesWithNumber: aPLNumber [ 
	^ aPLNumber unifiesWithValue: value
]

{ #category : #unification }
PLNumber >> unifiesWithTerm: aTerm [
	^ aTerm unifiesWithNumber: self
]

{ #category : #unification }
PLNumber >> unifiesWithValue: anInteger [ 
	^ value == anInteger
]

{ #category : #unification }
PLNumber >> unifiesWithVariable: aPLVariable [ 
	^ aPLVariable unifiesWithNumber: self
]

{ #category : #evaluating }
PLNumber >> value [
	^ value
]

{ #category : #accessing }
PLNumber >> value: anInteger [ 
	value := anInteger
]
