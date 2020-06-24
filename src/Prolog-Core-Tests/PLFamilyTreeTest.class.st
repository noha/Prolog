Class {
	#name : #PLFamilyTreeTest,
	#superclass : #PLKnowledgeBaseTest,
	#category : #'Prolog-Core-Tests'
}

{ #category : #running }
PLFamilyTreeTest >> knowledgeBaseSource [
	^ self prologSourceFamilyTree 
]

{ #category : #tests }
PLFamilyTreeTest >> testFamilyTreeFemaleGrandparents [
	| result  |
	result := knowledgeBase query: 'female(X), parent(X, Y), parent(Y, C)'.
	self assert: result size = 2.
	self assert: result second size = 3
]

{ #category : #tests }
PLFamilyTreeTest >> testFamilyTreeFemaleParents [
	|  result |
	knowledgeBase := self parse: self prologSourceFamilyTree.
	result := knowledgeBase query: 'female(X), parent(X, Y)'.
	self assert: result size = 2.
	self assert: result second size = 6
]

{ #category : #tests }
PLFamilyTreeTest >> testFamilyTreeOnlyMales [
	|  result |
	knowledgeBase := self parse: self prologSourceFamilyTree.
	result := knowledgeBase query: 'male(X)'.
	self assert: result size = 2.
	self assert: result second size = 5
]
