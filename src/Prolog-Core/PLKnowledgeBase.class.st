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

{ #category : #accessing }
PLKnowledgeBase >> terms: aCollection [ 
	terms := aCollection 
]
