Class {
	#name : #PLTerm,
	#superclass : #Object,
	#instVars : [
		'parent'
	],
	#category : #'Prolog-Core-Model'
}

{ #category : #'as yet unclassified' }
PLTerm >> callContext [
	^ PLCurrentCallContext value
]

{ #category : #accessing }
PLTerm >> knowledgeBase [
	^ self myCallContext knowledgeBase 
]

{ #category : #'as yet unclassified' }
PLTerm >> myCallContext [
	^ PLCurrentCallContext value contextFor: self
]

{ #category : #accessing }
PLTerm >> parent [
	^ parent
]

{ #category : #accessing }
PLTerm >> parent: anObject [
	parent := anObject
]

{ #category : #'as yet unclassified' }
PLTerm >> top [
	
	^ self parent 
		ifNotNil: [ :parent | parent top ]
		ifNil: [  self ]
]
