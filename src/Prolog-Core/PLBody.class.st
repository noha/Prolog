Class {
	#name : #PLBody,
	#superclass : #PLTerm,
	#instVars : [
		'terms'
	],
	#category : #'Prolog-Core'
}

{ #category : #'instance creation' }
PLBody class >> terms: aCollection [ 
	^ self new
		terms: aCollection 
]

{ #category : #printing }
PLBody >> printOn: aStream [
	terms printOn: aStream
]

{ #category : #accessing }
PLBody >> terms: aCollection [
	terms do: [ :each | each parent: self ].
	terms := aCollection
]
