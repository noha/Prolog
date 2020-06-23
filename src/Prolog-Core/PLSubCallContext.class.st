Class {
	#name : #PLSubCallContext,
	#superclass : #PLCallContext,
	#instVars : [
		'receiver',
		'sender',
		'parent'
	],
	#category : #'Prolog-Core'
}

{ #category : #'as yet unclassified' }
PLSubCallContext >> callTerm: aTerm [
	^ self 
		execute: [ aTerm call ]
		for: aTerm
		copyVariables: false
	
	
]

{ #category : #'as yet unclassified' }
PLSubCallContext >> callTerm: aTerm copyVariables: aBoolean [
	^ self 
		execute: [ aTerm call ]
		for: aTerm
		copyVariables: aBoolean
	
	
]

{ #category : #'as yet unclassified' }
PLSubCallContext >> contextFor: aTerm [ 
	| current ctx |
	current := aTerm.
	[ current isNil or: [ receiver = current] ] whileFalse: [ 
		current := current parent ].
	current ifNotNil: [ ^ self ].
	ctx := self parent contextFor: aTerm.
	ctx ifNil: [  self halt ].
	^ ctx
]

{ #category : #'as yet unclassified' }
PLSubCallContext >> execute: aBlock for: aTerm [
	| ctx |
	self halt.
	ctx := self newContext
		receiver: aTerm.
	^ PLCurrentCallContext 
		value: ctx
		during: aBlock
	
]

{ #category : #'as yet unclassified' }
PLSubCallContext >> execute: aBlock for: aTerm copyVariables: aBoolean [
	| ctx |
	ctx := self newContext
		receiver: aTerm.
	aBoolean ifTrue: [ 
		ctx variables addAll: variables ].
	^ PLCurrentCallContext 
		value: ctx
		during: aBlock
	
]

{ #category : #'as yet unclassified' }
PLSubCallContext >> makeCopy [
	^ self copy 
		parent: parent copy;
		yourself
]

{ #category : #'as yet unclassified' }
PLSubCallContext >> newContext [
	^ PLSubCallContext new
		knowledgeBase: knowledgeBase;
		parent: self
]

{ #category : #'as yet unclassified' }
PLSubCallContext >> parent [
	^ parent
]

{ #category : #'as yet unclassified' }
PLSubCallContext >> parent: aPLCallContext [ 
	parent := aPLCallContext
]

{ #category : #copying }
PLSubCallContext >> postCopy [ 
	super postCopy.
	variables := variables copy.
	choicePoints := choicePoints copy.

]

{ #category : #printing }
PLSubCallContext >> printOn: aStream [
	aStream << 'call context for: '.
	receiver printOn: aStream
]

{ #category : #'as yet unclassified' }
PLSubCallContext >> receiver [
	^ receiver
]

{ #category : #'as yet unclassified' }
PLSubCallContext >> receiver: aTerm [
	receiver := aTerm
]

{ #category : #accessing }
PLSubCallContext >> sender [
	^ parent receiver
]

{ #category : #'as yet unclassified' }
PLSubCallContext >> sender: aTerm [
	sender := aTerm
]

{ #category : #'as yet unclassified' }
PLSubCallContext >> variables [
	^ variables 
]
