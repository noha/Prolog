Class {
	#name : #PLCompoundTerm,
	#superclass : #PLTerm,
	#instVars : [
		'functor',
		'arguments'
	],
	#category : #'Prolog-Core'
}

{ #category : #'instance creation' }
PLCompoundTerm class >> functor: anAtom arguments: aCollection [ 
	^ self new
		functor: anAtom arguments: aCollection 
]

{ #category : #'as yet unclassified' }
PLCompoundTerm >> call [
	| candidates terms r v ret |
	terms := self knowledgeBase termsWithAtom: functor.
	"candidates := terms select: [ :each | each unifiesWithTerm: self ]."
	v := OrderedCollection new.
	r := terms do: [ :each | | ctx |
		ctx := self callContext newCallContext.
		ret := PLCurrentCallContext 
			value: ctx
			during: [ each unifiesWithTerm: self ].
		ret ifTrue: [ 
			v add: ctx ] ].
	^ String streamContents: [:stream |
		v do: [ :each |
			each printOn: stream ] ]
]

{ #category : #accessing }
PLCompoundTerm >> functor [
	^ functor
]

{ #category : #accessing }
PLCompoundTerm >> functor: anAtom arguments: aCollection [ 
	functor := anAtom.
	self assert: (aCollection isCollection not).
	arguments := aCollection
]

{ #category : #accessing }
PLCompoundTerm >> functorName [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
PLCompoundTerm >> hasSameFunctor: anAtom [ 
	^ anAtom unifiesWithAtom: functor
]

{ #category : #accessing }
PLCompoundTerm >> indexKey [
	^ functor name
]

{ #category : #printing }
PLCompoundTerm >> printOn: aStream [
	functor printOn: aStream.
	aStream << '('.
	"arguments 
		do: [ :each | each printOn: aStream ]
		separatedBy: [ aStream << ', ' ]."
	arguments printOn: aStream.
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
PLCompoundTerm >> unifiesWithTerm: aTerm [ 
	^ aTerm unifiesWithCompundTerm: self
]

{ #category : #unifying }
PLCompoundTerm >> unifyArguments: aPLLinkedList [ 
	^ aPLLinkedList unifiesWithList: arguments
]
