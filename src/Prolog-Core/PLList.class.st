Class {
	#name : #PLList,
	#superclass : #PLTerm,
	#instVars : [
		'elements'
	],
	#category : #'Prolog-Core-Model'
}

{ #category : #accessing }
PLList class >> elements: aCollection [ 
	^ self new
		elements: aCollection 
]

{ #category : #'as yet unclassified' }
PLList >> allButFirst [
	^ self class new 
		elements: elements allButFirst 
]

{ #category : #'as yet unclassified' }
PLList >> call [
	| ctx ret choicePoints |
	ctx := self myCallContext. 
	ctx addChoicePoints: { ctx }.
	choicePoints := OrderedCollection new.
	choicePoints add: ctx.
	elements do: [ :argument | | nextChoicePoints |
		nextChoicePoints := OrderedCollection new.
		[ choicePoints isEmpty ] whileFalse: [  | choicePoint |
			choicePoint := choicePoints removeFirst..
			ret := choicePoint callTerm: argument copyVariables: true.
			(ret first = true) ifFalse: [ 
				^ false ].
			nextChoicePoints addAll: ret second].
			choicePoints addAll: nextChoicePoints ].
	^ { true . choicePoints }
]

{ #category : #accessing }
PLList >> elementAt: anInteger [ 
	^ elements at: anInteger 
]

{ #category : #accessing }
PLList >> elements: aCollection [ 
	self flag: #todo.
	"overwritten method from super to disable collection check which is ok here"
	self assert: (aCollection isKindOf: PLList) not.
	aCollection do: [:each | each parent: self].
	elements := aCollection
]

{ #category : #accessing }
PLList >> first [
	^ elements first
]

{ #category : #'as yet unclassified' }
PLList >> hasSameElements: aCollection [ 
	elements withIndexDo: [ :each :index |
		(each unifiesWithTerm: (aCollection at: index)) ifFalse: [ 
			^ false ] ].
	^ true
]

{ #category : #testing }
PLList >> isEmpty [
	^ elements isNil or: [ elements isEmpty ]
]

{ #category : #'as yet unclassified' }
PLList >> parent: aTerm [
	super parent: aTerm.
	elements ifNil: [ ^ self ].
	elements do: [ :each | each parent: self  ]
]

{ #category : #printing }
PLList >> printElementsOn: aStream [
	elements 
		do: [ :each | each printOn: aStream ]
		separatedBy: [ aStream << ', ' ].

]

{ #category : #printing }
PLList >> printOn: aStream [
	"aStream << functor."
	aStream << '['.
	self printElementsOn: aStream.
	aStream << ']'
]

{ #category : #accessing }
PLList >> size [
	^ elements size
]

{ #category : #'as yet unclassified' }
PLList >> unifiesWithList: aPLLinkedList [ 
	^ aPLLinkedList unifyArguments: elements
]

{ #category : #'as yet unclassified' }
PLList >> unifiesWithTerm: aTerm [
	^ aTerm unifiesWithList: self 
]

{ #category : #'as yet unclassified' }
PLList >> unifyArguments: aCollection [ 
	elements withIndexDo: [ :each :index |
		(each unifiesWithTerm: (aCollection at: index)) ifFalse: [ 
			^ false ] ].
	^ true
]
