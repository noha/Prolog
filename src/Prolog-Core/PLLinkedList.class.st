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
