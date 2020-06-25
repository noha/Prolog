Class {
	#name : #PLAtom,
	#superclass : #PLConstant,
	#instVars : [
		'name'
	],
	#category : #'Prolog-Core-Model'
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
PLAtom >> unify: aTerm [
	^ aTerm unifyWithAtom: self 
]

{ #category : #'as yet unclassified' }
PLAtom >> unifyWithAtom: aAtom [ 
	^ aAtom hasSameName: name
]

{ #category : #unifying }
PLAtom >> unifyWithNumber: aPLNumber [ 
	^ false
]

{ #category : #'as yet unclassified' }
PLAtom >> unifyWithVariable: aPLVariable [ 
	^ aPLVariable unifyWithAtom: self
]
