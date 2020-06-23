Class {
	#name : #PLTerm,
	#superclass : #Object,
	#category : #'Prolog-Core'
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

{ #category : #'as yet unclassified' }
PLTerm >> top [
	
	^ self parent 
		ifNotNil: [ :parent | parent top ]
		ifNil: [  self ]
]
