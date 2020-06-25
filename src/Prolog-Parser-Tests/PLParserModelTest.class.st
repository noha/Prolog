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
