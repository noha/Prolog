Class {
	#name : #PLKnowledgeBase,
	#superclass : #Object,
	#instVars : [
		'terms'
	],
	#category : #'Prolog-Core'
}

{ #category : #'as yet unclassified' }
PLKnowledgeBase class >> terms: aCollection [ 
	^ self new
		terms: aCollection 
]

{ #category : #'instance creation' }
PLKnowledgeBase >> newCallContext [
	^ PLCallContext new
		knowledgeBase: self 
]

{ #category : #searching }
PLKnowledgeBase >> query: aString [ 
	| queryStructure |
	queryStructure := (PrologParser parse: '?- ', aString startingAt: #query) second.
	^ PLCurrentCallContext 
		value: self newCallContext
		during: [  queryStructure call ]
]

{ #category : #accessing }
PLKnowledgeBase >> terms [
	^ terms
]

{ #category : #accessing }
PLKnowledgeBase >> terms: aCollection [ 
	terms := aCollection groupedBy: #indexKey
]

{ #category : #searching }
PLKnowledgeBase >> termsWithAtom: aPLAtom [ 
	^ terms 
		at: aPLAtom name
		ifAbsent: [ #() ]
]
