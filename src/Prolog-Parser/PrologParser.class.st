Class {
	#name : #PrologParser,
	#superclass : #PrologGrammar,
	#category : #'Prolog-Parser'
}

{ #category : #accessing }
PrologParser >> atom [
	^ super atom ==> [ :node | PLAtom named: node ]
]

{ #category : #accessing }
PrologParser >> clause [
	^ super clause ==> #first
]

{ #category : #accessing }
PrologParser >> compoundTerm [
	^ ( atom, $( asPParser trim, termList,  $) asPParser trim ) ==> [ :nodes | PLCompoundTerm functor: nodes first arguments: nodes third ]
]

{ #category : #'as yet unclassified' }
PrologParser >> fact [
	^ super fact ==> [ :node | PLFact head: node ]
]

{ #category : #accessing }
PrologParser >> rule [
	^ super rule ==> [ :nodes | PLRule head: nodes first body: nodes third ]  
]

{ #category : #accessing }
PrologParser >> termList [
	^ super termList withoutSeparators ==> [ :nodes | nodes ]
]
