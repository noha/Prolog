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

{ #category : #'as yet unclassified' }
PrologParser >> fact [
	^ super fact ==> [ :node | PLHead head: node ]
]

{ #category : #accessing }
PrologParser >> infixCompoundTerm [
	^ super infixCompoundTerm ==> [ :nodes |
		(nodes second first first = ',') 
			ifTrue: [ self linkedListFrom: nodes ]
			ifFalse: [  
				(nodes second first first = ':-') 
					ifTrue: [ PLRule 
						head: nodes first
						body: (PLBody terms: (nodes second collect: #second)) ]
					ifFalse: [ self halt ]] ]
]

{ #category : #accessing }
PrologParser >> linkedListFrom: nodes [
	| args |
	args := OrderedCollection new.
	args add: nodes first.
	self assert: (nodes second allSatisfy: [ :each | each size = 2 ]).
	self assert: (nodes second allSatisfy: [ :each | each first = ',' ]).
	args addAll: (nodes second collect: #second).
	^ PLLinkedList functor: '.' arguments: args 
]

{ #category : #accessing }
PrologParser >> prefixCompoundTerm [
	^ super prefixCompoundTerm ==> [ :nodes | 
		PLCompoundTerm 
			functor: nodes first 
			arguments: (nodes third isCollection 
				ifTrue: [ self linkedListFrom: nodes third]
				ifFalse: [ nodes third ]) ]
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
PrologParser >> termList [
	^ super termList  ==> [ :nodes | nodes ]
]

{ #category : #accessing }
PrologParser >> variable [
	^ super variable ==> [ :nodes | PLVariable named: nodes ]
]
