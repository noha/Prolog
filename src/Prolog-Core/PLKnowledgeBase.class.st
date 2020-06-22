Class {
	#name : #PLKnowledgeBase,
	#superclass : #Object,
	#instVars : [
		'terms'
	],
	#category : #'Prolog-Core'
}

{ #category : #'instance creation' }
PLKnowledgeBase class >> terms: aCollection [ 
	^ self new 
		terms: aCollection
]

{ #category : #searching }
PLKnowledgeBase >> query: aString [ 
	| queryStructure |
	queryStructure := (PrologParser parse: '?- ', aString startingAt: #query) second.
	terms do: [ :each |
		 (each unifiesWith: queryStructure) ifTrue: [ 
			^ true ] ]
]

{ #category : #accessing }
PLKnowledgeBase >> terms: aCollection [ 
	terms := aCollection 
]
