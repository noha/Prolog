Class {
	#name : #PLRule,
	#superclass : #PLTerm,
	#instVars : [
		'head',
		'body'
	],
	#classInstVars : [
		'head',
		'body'
	],
	#category : #'Prolog-Core-Model'
}

{ #category : #'instance creation' }
PLRule class >> head: aTerm body: aTermList [ 
	^self new 
		head: aTerm body: aTermList
]

{ #category : #accessing }
PLRule >> head: aTerm body: aPLList [ 
	aTerm parent: self.
	head := aTerm.
	aPLList parent: self.
	body := aPLList 
]

{ #category : #accessing }
PLRule >> indexKey [
	^ head indexKey
]

{ #category : #printing }
PLRule >> printOn: aStream [
	head printOn: aStream.
	aStream << ' :- '.
	body printOn: aStream 
]

{ #category : #'as yet unclassified' }
PLRule >> unifiesWithTerm: aTerm [ 
	^ aTerm unifiesWithTerm: head 
]
