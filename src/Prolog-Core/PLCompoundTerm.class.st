Class {
	#name : #PLCompoundTerm,
	#superclass : #PLTerm,
	#instVars : [
		'functor',
		'arguments'
	],
	#category : #'Prolog-Core-Model'
}

{ #category : #'instance creation' }
PLCompoundTerm class >> functor: anAtom arguments: aCollection [ 
	^ self new
		functor: anAtom arguments: aCollection 
]

{ #category : #'as yet unclassified' }
PLCompoundTerm >> call [
	| terms succeeded ret |
	terms := self knowledgeBase termsWithAtom: functor.
	succeeded := OrderedCollection new.
	terms do: [ :each | | ctx |
		ctx := self callContext makeCopy.
		ret := ctx
			execute: [ each unify: self ]
			for: each
			copyVariables: false.
		ret ifTrue: [
			succeeded add: ctx ] ].
	^ { true . succeeded }
]

{ #category : #accessing }
PLCompoundTerm >> functor [
	^ functor
]

{ #category : #accessing }
PLCompoundTerm >> functor: anAtom arguments: aLinkedList [ 
	functor := anAtom.
	self assert: (aLinkedList isCollection not).
	self assert: (aLinkedList isKindOf: PLList).
	aLinkedList parent: self.
	arguments := aLinkedList
]

{ #category : #accessing }
PLCompoundTerm >> functorName [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
PLCompoundTerm >> hasSameFunctor: anAtom [ 
	^ anAtom unifyWithAtom: functor
]

{ #category : #accessing }
PLCompoundTerm >> indexKey [
	^ functor name
]

{ #category : #'as yet unclassified' }
PLCompoundTerm >> parent: aTerm [
	super parent: aTerm.
	arguments parent: self
]

{ #category : #printing }
PLCompoundTerm >> printOn: aStream [
	functor printOn: aStream.
	aStream << '('.
	"arguments 
		do: [ :each | each printOn: aStream ]
		separatedBy: [ aStream << ', ' ]."
	arguments printElementsOn: aStream.
	aStream << ')'
]

{ #category : #'as yet unclassified' }
PLCompoundTerm >> unifiesWith: aTerm [ 
	^ aTerm unifiesWithCompundTerm: self
]

{ #category : #'as yet unclassified' }
PLCompoundTerm >> unifiesWithCompundTerm: aPLCompoundTerm [ 
	(aPLCompoundTerm hasSameFunctor: functor) ifFalse: [
		^ false ].
	^ aPLCompoundTerm unifyArguments: arguments.
]

{ #category : #'as yet unclassified' }
PLCompoundTerm >> unify: aTerm [ 
	^ aTerm unifiesWithCompundTerm: self
]

{ #category : #unifying }
PLCompoundTerm >> unifyArguments: aPLLinkedList [ 
	^ aPLLinkedList unifyWithList: arguments
]
