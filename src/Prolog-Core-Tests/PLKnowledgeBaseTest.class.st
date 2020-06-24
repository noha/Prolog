Class {
	#name : #PLKnowledgeBaseTest,
	#superclass : #PLTest,
	#instVars : [
		'knowledgeBase'
	],
	#category : #'Prolog-Core-Tests'
}

{ #category : #running }
PLKnowledgeBaseTest >> setUp [ 
	knowledgeBase := self parse: self knowledgeBaseSource
]
