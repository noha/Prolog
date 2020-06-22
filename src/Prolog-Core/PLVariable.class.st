Class {
	#name : #PLVariable,
	#superclass : #PLTerm,
	#instVars : [
		'name'
	],
	#category : #'Prolog-Core'
}

{ #category : #accessing }
PLVariable >> name: aString [ 
	name := aString
]

{ #category : #printing }
PLVariable >> printOn: aStream [
	aStream << name
]
