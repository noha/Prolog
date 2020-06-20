Class {
	#name : #PLFact,
	#superclass : #PLTerm,
	#instVars : [
		'head'
	],
	#category : #'Prolog-Core'
}

{ #category : #'instance creation' }
PLFact class >> head: aCompoundTerm [ 
	^ self new 
		head: aCompoundTerm 
]

{ #category : #accessing }
PLFact >> head: aTerm [ 
	head := aTerm
]

{ #category : #printing }
PLFact >> printOn: aStream [
	head printOn: aStream
]
