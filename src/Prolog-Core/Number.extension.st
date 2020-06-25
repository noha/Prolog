Extension { #name : #Number }

{ #category : #'*Prolog-Core' }
Number >> asPLTerm [
	^ PLNumber value: self 
]
