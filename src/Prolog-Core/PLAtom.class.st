Class {
	#name : #PLAtom,
	#superclass : #PLConstant,
	#instVars : [
		'name'
	],
	#category : #'Prolog-Core'
}

{ #category : #'instance creation' }
PLAtom class >> named: aString [ 
	^ self new
		name: aString
]

{ #category : #accessing }
PLAtom >> name: aString [ 
	name := aString
]

{ #category : #printing }
PLAtom >> printOn: aStream [
	aStream << name
]
