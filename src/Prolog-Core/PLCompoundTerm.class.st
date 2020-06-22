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

{ #category : #accessing }
PLCompoundTerm >> functor: anAtom arguments: aCollection [ 
	functor := anAtom.
	self assert: (aCollection isCollection not).
	arguments := aCollection
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
