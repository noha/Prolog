Class {
	#name : #PLCustomLibraryTest,
	#superclass : #PLKnowledgeBaseTest,
	#category : #'Prolog-Core-Tests'
}

{ #category : #running }
PLCustomLibraryTest >> knowledgeBaseSource [

	^ 'member(El, [H|T]) :-
	member_(T, El, H).'
]

{ #category : #tests }
PLCustomLibraryTest >> testParse [ 
	knowledgeBase query: 'member(2, [1,2,3])'
]
