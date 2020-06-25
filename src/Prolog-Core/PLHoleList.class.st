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

{ #category : #initialization }
PLHoleList >> head: headVariable tail: tailVariable [ 
	headVariable parent: self.
	head := headVariable.
	tailVariable parent: self.
	tail := tailVariable 
]

{ #category : #'as yet unclassified' }
PLHoleList >> unifiesWithList: aPLList [ 
	aPLList isEmpty ifTrue: [ 
		^ false ].
	(head unifiesWithTerm: aPLList first) ifFalse: [
		^ false ].
	(aPLList size > 1) ifTrue: [ 
		tail unifiesWithList: aPLList allButFirst ].
	^ true

]
