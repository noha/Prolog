Extension { #name : #String }

{ #category : #'*Prolog-Core' }
String >> asPLTerm [
	^ PLAtom named: self
]
