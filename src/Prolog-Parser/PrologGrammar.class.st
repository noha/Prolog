Class {
	#name : #PrologGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'program',
		'knowledgeBase',
		'clauseList',
		'query',
		'clause',
		'predicate',
		'predicateList',
		'atom',
		'termList',
		'term',
		'numeral',
		'variable',
		'structure',
		'smallAtom',
		'string',
		'character',
		'special',
		'uppercase',
		'lowercase'
	],
	#category : #'Prolog-Parser'
}

{ #category : #accessing }
PrologGrammar >> atom [ 
	^ (smallAtom / ($' asPParser, string, $' asPParser)) flatten
]

{ #category : #accessing }
PrologGrammar >> character [
	^ lowercase / uppercase / #digit asPParser / special 
]

{ #category : #accessing }
PrologGrammar >> clause [
	^ ((predicate, ':-' asPParser trim, predicateList) / predicate), $. asPParser trim
]

{ #category : #accessing }
PrologGrammar >> clauseList [
	^ clause plus
]

{ #category : #accessing }
PrologGrammar >> knowledgeBase [
	^ clauseList
]

{ #category : #converting }
PrologGrammar >> lowercase [ 
	^ PP2PredicateObjectNode new
		predicate: [ :each | each isLowercase ];
		predicateMessage: 'lowercase character expected';
		negated: [ :each | each isUppercase ];
		negatedMessage: 'uppercase character expected';
		yourself
]

{ #category : #accessing }
PrologGrammar >> numeral [
	^ #digit asPParser plus flatten
]

{ #category : #accessing }
PrologGrammar >> predicate [
	^ ( atom, $( asPParser, termList, $) asPParser ) / atom
]

{ #category : #accessing }
PrologGrammar >> predicateList [
	^ predicate separatedBy: $, asPParser trim
]

{ #category : #accessing }
PrologGrammar >> program [
	^ (clauseList, query) / query
]

{ #category : #accessing }
PrologGrammar >> query [
	^ '?-' asPParser , predicateList 
]

{ #category : #accessing }
PrologGrammar >> smallAtom [ 
	^ lowercase, character star
]

{ #category : #accessing }
PrologGrammar >> special [
	^ PP2PredicateObjectNode anyOf: #( + - * / \ ^ ~ : . ? #' ' #'#' $ &)
]

{ #category : #accessing }
PrologGrammar >> start [ 
	^ knowledgeBase end
]

{ #category : #accessing }
PrologGrammar >> string [
	^ character plus
]

{ #category : #accessing }
PrologGrammar >> structure [
	^ atom, $( asPParser , termList, $) asPParser 
]

{ #category : #accessing }
PrologGrammar >> term [
	^ structure / numeral / atom / variable 
]

{ #category : #accessing }
PrologGrammar >> termList [
	^ term separatedBy: $, asPParser trim
]

{ #category : #converting }
PrologGrammar >> uppercase [ 
	^ PP2PredicateObjectNode new
		predicate: [ :each | each isUppercase ];
		predicateMessage: 'uppercase character expected';
		negated: [ :each | each isLowercase ];
		negatedMessage: 'lowercase character expected';
		yourself

]

{ #category : #accessing }
PrologGrammar >> variable [ 
	^ (uppercase, character star) flatten
]
