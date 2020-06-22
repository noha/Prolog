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
	#category : #'Prolog-Core'
}

{ #category : #'instance creation' }
PLRule class >> head: aTerm body: aTermList [ 
	^self new 
		head: aTerm body: aTermList
]

{ #category : #accessing }
PLRule >> head: aTerm body: aCollection [ 
	head := aTerm.
	body := aCollection 
]

{ #category : #printing }
PLRule >> printOn: aStream [
	head printOn: aStream.
	aStream << ' :- '.
	body printOn: aStream 
]
