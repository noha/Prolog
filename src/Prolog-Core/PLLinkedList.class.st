Class {
	#name : #PLLinkedList,
	#superclass : #PLCompoundTerm,
	#category : #'Prolog-Core'
}

{ #category : #accessing }
PLLinkedList >> functor: anAtom arguments: aCollection [ 
	self flag: #todo.
	"overwritten method from super to disable collection check which is ok here"
	functor := anAtom.
	arguments := aCollection
]

{ #category : #'as yet unclassified' }
PLLinkedList >> hasSameArguments: aCollection [ 
	arguments withIndexDo: [ :each :index |
		(each unifiesWithTerm: (aCollection at: index)) ifFalse: [ 
			^ false ] ].
	^ true
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
	^ aPLLinkedList hasSameArguments: arguments
]

{ #category : #'as yet unclassified' }
PLLinkedList >> unifiesWithTerm: aTerm [
	^ aTerm unifiesWithList: self 
]
