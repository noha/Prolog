Extension { #name : #Collection }

{ #category : #'*prolog-core' }
Collection >> asPLTerm [
	^ PLList elements: self 
]
