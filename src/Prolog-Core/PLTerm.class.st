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
	^ self callContext knowledgeBase 
]
