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
PrologParser >> commaList [
	^ super commaList withoutSeparators ==> [ :nodes | 
		PLLinkedList functor: '.' arguments: nodes ]
]

{ #category : #'as yet unclassified' }
PrologParser >> fact [
	^ super fact ==> [ :node | PLHead head: node ]
]

{ #category : #accessing }
PrologParser >> infixCompoundTerm [
	^ super infixCompoundTerm ==> [ :nodes | self halt. nodes ]
]

{ #category : #accessing }
PrologParser >> infixCompoundTermX [
	^ super infixCompoundTerm ==> [ :nodes | | n args |
		n := OrderedCollection new.
		n add: nodes first.
		args := nodes second flattened.
		n addAll: (args reject: [ :each | each = ',' ]).
		(args first = ',') 
			ifTrue: [ self linkedListFrom: n ]
			ifFalse: [ self halt ] ]
]

{ #category : #accessing }
PrologParser >> linkedListFrom: nodes [
	self assert: (nodes noneSatisfy: [ :each | each isString not and: [ each isCollection ] ]).
	^ PLLinkedList functor: '.' arguments: nodes 
]

{ #category : #accessing }
PrologParser >> prefixCompoundTerm [
	^ super prefixCompoundTerm ==> [ :nodes | 
		PLCompoundTerm 
			functor: nodes first 
			arguments: (nodes third isCollection 
				ifTrue: [ self linkedListFrom: nodes third]
				ifFalse: [ 
					self assert: (nodes third isKindOf: PLLinkedList).
					nodes third]) ]
]

{ #category : #accessing }
PrologParser >> rule [
	^ super rule ==> [ :nodes | PLRule head: nodes first body: nodes third ]  
]

{ #category : #accessing }
PrologParser >> start [
	^ super start ==> [ :nodes| PLKnowledgeBase terms: nodes ]
]

{ #category : #accessing }
PrologParser >> termListWithOperators [
	^ super termListWithOperators withoutSeparators ==> [ :nodes | 
		PLLinkedList functor: '.' arguments: nodes ]
			
		
]

{ #category : #accessing }
PrologParser >> variable [
	^ super variable ==> [ :nodes | PLVariable named: nodes ]
]
