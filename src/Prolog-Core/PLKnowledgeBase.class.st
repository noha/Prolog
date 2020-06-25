Class {
	#name : #PLKnowledgeBase,
	#superclass : #Object,
	#instVars : [
		'terms'
	],
	#category : #'Prolog-Core-Model'
}

{ #category : #'as yet unclassified' }
PLKnowledgeBase class >> terms: aCollection [ 
	^ self new
		terms: aCollection 
]

{ #category : #'as yet unclassified' }
PLKnowledgeBase >> call: aTerm [
	| ctx |
	ctx := PLSubCallContext new
		knowledgeBase: self;
		receiver: aTerm;
		sender: self.
	^ ctx callTerm: aTerm
]

{ #category : #'instance creation' }
PLKnowledgeBase >> newCallContext [
	^ PLCallContext new
		knowledgeBase: self 
]

{ #category : #searching }
PLKnowledgeBase >> query: aString [ 
	| queryStructure ret |
	queryStructure := (PrologParser parse: '?- ', aString startingAt: #query) second.
	ret := self call: queryStructure.
	^ ret
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
