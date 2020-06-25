Class {
	#name : #PLHoleList,
	#superclass : #PLTerm,
	#instVars : [
		'head',
		'tail'
	],
	#category : #'Prolog-Core-Model'
}

{ #category : #'instance creation' }
PLHoleList class >> head: headVariable tail: tailVariable [
	^ self new 
		head: headVariable tail: tailVariable 
]

{ #category : #'as yet unclassified' }
PLHoleList class >> parent: aPLList [ 
	self shouldBeImplemented.
]

{ #category : #accessing }
PLHoleList >> head [
	^ head
]

{ #category : #initialization }
PLHoleList >> head: headVariable tail: tailVariable [ 
	headVariable parent: self.
	head := headVariable.
	tailVariable parent: self.
	tail := tailVariable 
]

{ #category : #accessing }
PLHoleList >> tail [
	^ tail
]

{ #category : #'as yet unclassified' }
PLHoleList >> unifyWithList: aPLList [ 
	aPLList isEmpty ifTrue: [ 
		^ false ].
	(head unify: aPLList first) ifFalse: [
		^ false ].
	(aPLList size > 1) ifTrue: [ 
		tail unifyWithList: aPLList allButFirst ].
	^ true

]
