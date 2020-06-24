Class {
	#name : #PLNumber,
	#superclass : #PLConstant,
	#instVars : [
		'value'
	],
	#category : #'Prolog-Core'
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

{ #category : #'as yet unclassified' }
PLNumber >> unifiesWithNumber: aPLNumber [ 
	^ aPLNumber unifiesWithValue: value
]

{ #category : #'as yet unclassified' }
PLNumber >> unifiesWithTerm: aTerm [
	^ aTerm unifiesWithNumber: self
]

{ #category : #'as yet unclassified' }
PLNumber >> unifiesWithValue: anInteger [ 
	^ value == anInteger
]

{ #category : #'as yet unclassified' }
PLNumber >> unifiesWithVariable: aPLVariable [ 
	^ aPLVariable unifiesWithNumber: self
]

{ #category : #accessing }
PLNumber >> value: anInteger [ 
	value := anInteger
]
