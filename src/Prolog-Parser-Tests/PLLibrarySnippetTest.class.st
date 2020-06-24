Class {
	#name : #PLLibrarySnippetTest,
	#superclass : #PrologGrammarTest,
	#category : #'Prolog-Parser-Tests'
}

{ #category : #tests }
PLLibrarySnippetTest >> testMember [
	self
		parse: 'member(El, [H|T]) :-
	member_(T, El, H).'
]
