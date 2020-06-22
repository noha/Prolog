Class {
	#name : #BaselineOfProlog,
	#superclass : #BaselineOf,
	#category : #BaselineOfProlog
}

{ #category : #baseline }
BaselineOfProlog >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		spec
			package: 'Prolog-Core';
			package: 'Prolog-Core-Tests' with: [ spec requires: #('Prolog-Core') ];
			package: 'Prolog-Parser' with: [ spec requires: #('Prolog-Core' 'PetitParser2Core') ];
			package: 'Prolog-Parser-Tests' with: [ spec requires: #('Prolog-Parser') ];

			group: 'default' with: #(core parser);
			group: 'core' with: #('Prolog-Core');
			group: 'parser' with: #('Prolog-Parser');
			group: 'tests' with: #('Prolog-Core-Tests' 'Prolog-Parser-Tests').
		self petitParserCore: spec. ]
]

{ #category : #baseline }
BaselineOfProlog >> petitParserCore: spec [
	spec baseline: 'PetitParser2Core' with: [ 
			spec 
				repository: 'github://kursjan/petitparser2:master' ].
]
