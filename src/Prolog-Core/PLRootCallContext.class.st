Class {
	#name : #PLRootCallContext,
	#superclass : #Object,
	#instVars : [
		'knowledgeBase',
		'variables',
		'choicePoints'
	],
	#category : #'Prolog-Core'
}

{ #category : #accessing }
PLRootCallContext >> addChoicePoints: aCollection [ 
	choicePoints addAll: aCollection
]

{ #category : #'as yet unclassified' }
PLRootCallContext >> choicePoints [
	^ choicePoints
]

{ #category : #initialization }
PLRootCallContext >> initialize [ 
	super initialize.
	variables := OrderedDictionary new.
	choicePoints := OrderedCollection new
]

{ #category : #accessing }
PLRootCallContext >> knowledgeBase [
	^ knowledgeBase
]

{ #category : #accessing }
PLRootCallContext >> knowledgeBase: aPLKnowledgeBase [ 
	knowledgeBase:= aPLKnowledgeBase 
]

{ #category : #'as yet unclassified' }
PLRootCallContext >> newCallContext [
	^ self class new 
		knowledgeBase: knowledgeBase 
]

{ #category : #printing }
PLRootCallContext >> printOn: aStream [
	variables keysAndValuesDo: [ :key :value |
		aStream << key << '='.
		value printOn: aStream.
	aStream  << String cr ]
]

{ #category : #accessing }
PLRootCallContext >> variableAt: variableName put: aTerm [
	self assert: (variables at: variableName ifAbsent: [nil ]) isNil.
	variables 
		at: variableName 
		put: aTerm
]
