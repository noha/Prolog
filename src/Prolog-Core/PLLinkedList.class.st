Class {
	#name : #PLLinkedList,
	#superclass : #PLCompoundTerm,
	#category : #'Prolog-Core'
}

{ #category : #'as yet unclassified' }
PLLinkedList >> call [
	| ctx ret ctxCopy prev choicePoints |
	ctx := self myCallContext.
	ctx addChoicePoints: { ctx }.
	prev := ctx.
	choicePoints := OrderedCollection new.
	choicePoints add: ctx.
	arguments do: [ :argument | | nextChoicePoints |
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
PLLinkedList >> functor: anAtom arguments: aCollection [ 
	self flag: #todo.
	"overwritten method from super to disable collection check which is ok here"
	functor := anAtom.
	self assert: (aCollection isKindOf: PLLinkedList) not.
	self assert: (aCollection noneSatisfy: [:each | each isKindOf: PLLinkedList]).
	aCollection do: [:each | each parent: self].
	arguments := aCollection
]

{ #category : #'as yet unclassified' }
PLLinkedList >> hasSameArguments: aCollection [ 
	arguments withIndexDo: [ :each :index |
		(each unifiesWithTerm: (aCollection at: index)) ifFalse: [ 
			^ false ] ].
	^ true
]

{ #category : #'as yet unclassified' }
PLLinkedList >> parent: aTerm [
	arguments do: [ :each | each parent: aTerm ]
]

{ #category : #printing }
PLLinkedList >> printOn: aStream [
	"aStream << functor."
	arguments 
		do: [ :each | each printOn: aStream ]
		separatedBy: [ aStream << ', ' ].
]

{ #category : #'as yet unclassified' }
PLLinkedList >> unifiesWithList: aPLLinkedList [ 
	^ aPLLinkedList unifyArguments: arguments
]

{ #category : #'as yet unclassified' }
PLLinkedList >> unifiesWithTerm: aTerm [
	^ aTerm unifiesWithList: self 
]

{ #category : #'as yet unclassified' }
PLLinkedList >> unifyArguments: aCollection [ 
	arguments withIndexDo: [ :each :index |
		(each unifiesWithTerm: (aCollection at: index)) ifFalse: [ 
			^ false ] ].
	^ true
]
