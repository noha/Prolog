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
		'number',
		'infixCompoundTerm',
		'prefixCompoundTerm',
		'operator',
		'operatorList',
		'atomCharacter',
		'head',
		'commaList',
		'termListWithOperators',
		'holeList',
		'fullCommaList',
		'emptyList'
	],
	#category : #'Prolog-Parser'
}

{ #category : #accessing }
PrologGrammar >> atom [ 
	"An atom is a collection of atom characters starting with either a lowercase letter 
	or is enclosed in single quotes."
	self flag: #todo.
	"Combination of special characters I saw somewhere on the net but not sure"
	^ (lowercase, atomCharacter star / ($' asPParser, string, $' asPParser)) flatten / emptyList
]

{ #category : #accessing }
PrologGrammar >> atomCharacter [
	^ lowercase / uppercase / #digit asPParser / $_ asPParser 
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
PrologGrammar >> commaList [
	^ term separatedBy: $, asPParser trim
]

{ #category : #accessing }
PrologGrammar >> compoundTerm [
	^ rule / infixCompoundTerm / prefixCompoundTerm
]

{ #category : #accessing }
PrologGrammar >> emptyList [
	^ '[]' asPParser trim
]

{ #category : #'as yet unclassified' }
PrologGrammar >> fact [
	^ head
]

{ #category : #accessing }
PrologGrammar >> fullCommaList [
	^ $[ asPParser trim, (term separatedBy: $, asPParser trim), $] asPParser trim
]

{ #category : #'as yet unclassified' }
PrologGrammar >> head [
	^ prefixCompoundTerm / atom
]

{ #category : #accessing }
PrologGrammar >> holeList [
	^ $[ asPParser trim, term , $| asPParser trim , term , $] asPParser trim
]

{ #category : #accessing }
PrologGrammar >> infixCompoundTerm [
	^ (prefixCompoundTerm / variable) , operatorList
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
PrologGrammar >> operator [ 
	^ "',' asPParser /" ':-' asPParser / 'is' asPParser / $+ asPParser 
]

{ #category : #accessing }
PrologGrammar >> operatorList [
	^ (operator trim , term) plus
]

{ #category : #accessing }
PrologGrammar >> prefixCompoundTerm [
	^ atom, $( asPParser trim, termList,  $) asPParser trim
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
	^ head, ':-' asPParser trim, termList
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
	^ (character / special) plus
]

{ #category : #accessing }
PrologGrammar >> term [
	^ compoundTerm / atom / variable / number / holeList / fullCommaList
]

{ #category : #accessing }
PrologGrammar >> termList [
	^ commaList / termListWithOperators
]

{ #category : #accessing }
PrologGrammar >> termListWithOperators [
	^ term separatedBy: operator trim
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
	"A variable does either:
	- starts with an uppercase letter and contains only valid chars
	- starts with an underscore. Special variable is only underscore"
	^ ((uppercase, atomCharacter star) / ($_ asPParser, atomCharacter star))  flatten
]
