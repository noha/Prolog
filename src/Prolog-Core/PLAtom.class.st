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

{ #category : #'as yet unclassified' }
PLAtom >> call [
	^ (self knowledgeBase termsWithAtom: self) notEmpty 
]

{ #category : #testing }
PLAtom >> hasSameName: aString [ 
	^ name = aString
]

{ #category : #'as yet unclassified' }
PLAtom >> indexKey [
	^ name
]

{ #category : #accessing }
PLAtom >> name [
	^ name
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

{ #category : #'as yet unclassified' }
PLAtom >> unifiesWithVariable: aPLVariable [ 
	^ aPLVariable notGrounded or: [ 
		aPLVariable hasSameContent: name ]
]
