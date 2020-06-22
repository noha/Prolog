Class {
	#name : #PLCallContext,
	#superclass : #Object,
	#instVars : [
		'knowledgeBase',
		'variables'
	],
	#category : #'Prolog-Core'
}

{ #category : #initialization }
PLCallContext >> initialize [ 
	super initialize.
	variables := OrderedDictionary new
]

{ #category : #accessing }
PLCallContext >> knowledgeBase [
	^ knowledgeBase
]

{ #category : #accessing }
PLCallContext >> knowledgeBase: aPLKnowledgeBase [ 
	knowledgeBase:= aPLKnowledgeBase 
]

{ #category : #'as yet unclassified' }
PLCallContext >> newCallContext [
	^ self class new 
		knowledgeBase: knowledgeBase 
]

{ #category : #printing }
PLCallContext >> printOn: aStream [
	variables keysAndValuesDo: [ :key :value |
		aStream << key << '='.
		value printOn: aStream.
	aStream  << String cr ]
]

{ #category : #accessing }
PLCallContext >> variableAt: variableName put: aTerm [
	self assert: (variables at: variableName ifAbsent: [nil ]) isNil.
	variables 
		at: variableName 
		put: aTerm
]
