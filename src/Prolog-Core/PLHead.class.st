Class {
	#name : #PLHead,
	#superclass : #PLTerm,
	#instVars : [
		'head'
	],
	#category : #'Prolog-Core'
}

{ #category : #'instance creation' }
PLHead class >> head: aCompoundTerm [ 
	^ self new 
		head: aCompoundTerm 
]

{ #category : #calling }
PLHead >> call [
	^ head call
]

{ #category : #accessing }
PLHead >> functor [
	^ head functor
]

{ #category : #accessing }
PLHead >> head: aTerm [ 
	head := aTerm
]

{ #category : #accessing }
PLHead >> indexKey [
	^ head indexKey
]

{ #category : #printing }
PLHead >> printOn: aStream [
	head printOn: aStream
]

{ #category : #'as yet unclassified' }
PLHead >> unifiesWithCompundTerm: aPLCompoundTerm [ 
	^ head unifiesWithCompundTerm: aPLCompoundTerm 
]

{ #category : #'as yet unclassified' }
PLHead >> unifiesWithTerm: aTerm [ 
	^ head unifiesWithTerm: aTerm
]
