Class {
	#name : #PLCallContext,
	#superclass : #Object,
	#instVars : [
		'knowledgeBase',
		'variables',
		'choicePoints'
	],
	#category : #'Prolog-Core-Base'
}

{ #category : #accessing }
PLCallContext >> addChoicePoints: aCollection [ 
	choicePoints addAll: aCollection
]

{ #category : #'as yet unclassified' }
PLCallContext >> call: aTerm [
	| ctx |
	ctx := self newCallContext.
	"^ PLCurrentCallContext 
		value: c
		during: [ aTerm call ]"
	ctx callTerm: aTerm
]

{ #category : #'as yet unclassified' }
PLCallContext >> choicePoints [
	^ choicePoints
]

{ #category : #initialization }
PLCallContext >> initialize [ 
	super initialize.
	variables := OrderedDictionary new.
	choicePoints := OrderedCollection new
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

{ #category : #'as yet unclassified' }
PLCallContext >> variableAt: aString [ 
	^ variables at: aString ifAbsent: [ nil ]
]

{ #category : #accessing }
PLCallContext >> variableAt: variableName put: aTerm [
	self assert: (variables at: variableName ifAbsent: [nil ]) isNil.
	variables 
		at: variableName 
		put: aTerm
]
