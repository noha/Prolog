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
