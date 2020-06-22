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

{ #category : #testing }
PLAtom >> hasSameName: aString [ 
	^ name = aString
]

{ #category : #accessing }
PLAtom >> name: aString [ 
	name := aString
]

{ #category : #printing }
PLAtom >> printOn: aStream [
	aStream << name
]

{ #category : #'as yet unclassified' }
PLAtom >> unifiesWithAtom: aAtom [ 
	^ aAtom hasSameName: name
]

{ #category : #'as yet unclassified' }
PLAtom >> unifiesWithTerm: aTerm [
	^ aTerm unifiesWithAtom: self 
]
