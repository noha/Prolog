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
PLNumber >> unifiesWithValue: anInteger [ 
	^ value == anInteger
]

{ #category : #unification }
PLNumber >> unify: aTerm [
	^ aTerm unifyWithNumber: self
]

{ #category : #unifying }
PLNumber >> unifyWithAtom: aPLAtom [ 
	^ false
]

{ #category : #unification }
PLNumber >> unifyWithNumber: aPLNumber [ 
	^ aPLNumber unifiesWithValue: value
]

{ #category : #unification }
PLNumber >> unifyWithVariable: aPLVariable [ 
	^ aPLVariable unifyWithNumber: self
]

{ #category : #evaluating }
PLNumber >> value [
	^ value
]

{ #category : #accessing }
PLNumber >> value: anInteger [ 
	value := anInteger
]
