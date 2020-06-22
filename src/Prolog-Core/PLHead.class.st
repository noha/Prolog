Class {
	#name : #PLHead,
	#superclass : #PLTerm,
	#instVars : [
		'head'
	],
	#category : #'Prolog-Core'
}

{ #category : #'instance creation' }
PLHead class >> head: aCompoundTerm [ 
	^ self new 
		head: aCompoundTerm 
]

{ #category : #accessing }
PLHead >> head: aTerm [ 
	head := aTerm
]

{ #category : #printing }
PLHead >> printOn: aStream [
	head printOn: aStream
]

{ #category : #'as yet unclassified' }
PLHead >> unifiesWith: aTerm [ 
	^ head unifiesWith: aTerm
]
