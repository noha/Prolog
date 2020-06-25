Class {
	#name : #PLParserModelTest,
	#superclass : #PLSyntaxTest,
	#category : #'Prolog-Parser-Tests'
}

{ #category : #accessing }
PLParserModelTest >> parserClass [ 
	^ PrologParser 
]

{ #category : #tests }
PLParserModelTest >> testAtom [ 
	| model |
	model := self parse: 'atom' rule: #atom.
	self assert: (model isKindOf: PLAtom).
	self assert: model name = #atom
]

{ #category : #tests }
PLParserModelTest >> testListEmpty [
	| model |
	model := self parse: '[]' rule: #compoundTerm.
	self assert: (model isKindOf: PLList).
	self assert: model isEmpty 
]

{ #category : #tests }
PLParserModelTest >> testListHoleNested [
	| model |
	model := self parse: '[H|[H1|[H2|[]]]]' rule: #compoundTerm.
	self assert: (model isKindOf: PLHoleList).
	self assert: model head name equals: 'H'.
	self assert: model tail head name equals: 'H1'.
	self assert: model tail tail head name equals: 'H2'.
	self assert: model tail tail tail isEmpty.
]

{ #category : #tests }
PLParserModelTest >> testListHoleOneElementAndEmpty [
	| model |
	model := self parse: '[H|[]]' rule: #compoundTerm.
	self assert: (model isKindOf: PLHoleList).
	self assert: model head name equals: 'H'.
	self assert: (model tail isKindOf: PLList).
	self assert: model tail isEmpty.
]

{ #category : #tests }
PLParserModelTest >> testListOneElement [
	| model |
	model := self parse: '[a]' rule: #compoundTerm.
	self assert: (model isKindOf: PLList).
	self assert: model first name = 'a'
]

{ #category : #tests }
PLParserModelTest >> testListThreeElements [
	| model |
	model := self parse: '[a, X, v]' rule: #compoundTerm.
	self assert: (model isKindOf: PLList).
	self assert: (model elementAt: 2) name equals: 'X'
]

{ #category : #tests }
PLParserModelTest >> testNumberFloat [
	| model |
	model := self parse: '1.234' rule: #number.
	self assert: (model isKindOf: PLNumber).
	self assert: model value = 1.234
]

{ #category : #tests }
PLParserModelTest >> testNumberInteger [
	| model |
	model := self parse: '1234' rule: #number.
	self assert: (model isKindOf: PLNumber).
	self assert: model value = 1234
]
