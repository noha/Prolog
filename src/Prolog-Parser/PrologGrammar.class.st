Class {
	#name : #PrologGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'program',
		'knowledgeBase',
		'clauseList',
		'query',
		'clause',
		'atom',
		'termList',
		'term',
		'variable',
		'smallAtom',
		'string',
		'character',
		'special',
		'uppercase',
		'lowercase',
		'rule',
		'fact',
		'compoundTerm',
		'callable',
		'clauseTerm',
		'number'
	],
	#category : #'Prolog-Parser'
}

{ #category : #accessing }
PrologGrammar >> atom [ 
	^ (smallAtom / ($' asPParser, string, $' asPParser) / special plus) flatten
]

{ #category : #accessing }
PrologGrammar >> callable [
	^ compoundTerm / atom
]

{ #category : #accessing }
PrologGrammar >> character [
	^ lowercase / uppercase / #digit asPParser / special 
]

{ #category : #accessing }
PrologGrammar >> clause [
	^ clauseTerm , $. asPParser trim
]

{ #category : #accessing }
PrologGrammar >> clauseList [
	^ clause plus
]

{ #category : #accessing }
PrologGrammar >> clauseTerm [
	"added to keep syntactic sugar :- out of other term lists"
	^ rule / fact 
]

{ #category : #accessing }
PrologGrammar >> compoundTerm [
	^ ( atom, $( asPParser trim, termList,  $) asPParser trim )
]

{ #category : #'as yet unclassified' }
PrologGrammar >> fact [
	^ compoundTerm / atom
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
PrologGrammar >> number [
	^ #digit asPParser plus flatten
]

{ #category : #accessing }
PrologGrammar >> program [
	^ (clauseList, query) / query
]

{ #category : #accessing }
PrologGrammar >> query [
	^ '?-' asPParser trim, termList 
]

{ #category : #accessing }
PrologGrammar >> rule [
	^ fact, ':-' asPParser trim, termList
]

{ #category : #accessing }
PrologGrammar >> smallAtom [ 
	^ lowercase, character star
]

{ #category : #accessing }
PrologGrammar >> special [
	^ PP2PredicateObjectNode anyOf: {  $+ . $- . $* . $/ . $\ . $^ . $~ . $: . $. . $? . Character space .  $# . $$ . $& }
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
PrologGrammar >> term [
	^ compoundTerm / atom / variable / number 
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
