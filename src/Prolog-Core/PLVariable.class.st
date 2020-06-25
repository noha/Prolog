Class {
	#name : #PLVariable,
	#superclass : #PLTerm,
	#category : #'Prolog-Core-Model'
}

{ #category : #'as yet unclassified' }
PLVariable class >> named: aString [ 
	^ PLNamedVariable new  
		name: aString
]
