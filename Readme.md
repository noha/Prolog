Prolog
------

Another attempt to start a project that has low odds of being finished ever. This is my trial of understanding and implementing a prolog interpreter. I try to keep my struggles not only in code but also in this readme. 

- [x] started test hierarchy to test parser model
- [x] added more tests for the grammar
- [ ] add tests for unification
- [ ] implement operator model
- [ ] add tests for complex compound terms
- [ ] add test for member/2
- [ ] add test for append/3
- [ ] collect examples to parse for making basic grammar more solid
- [ ] understand lists. How to implement comman lists and hole lists best???

__2020-06-24__

Solve left recursion problem with prefix and infix compound terms. Unification attempts

- [x] understand compound terms (Xfix notation)
- [x] infix, postfix, etc. operators in prolog are special entities with configuration of Xfix notation and precedence
- [x] so my conclusion is to start with petit parser that can parse a family tree knowledgebase
- [x] first working unification between simple compound terms. Straight unification by double dispatch through the structure
- [x] terms now have a parent pointer to be able to identify the top term
- [x] unification on call is difficult. Call contexts are bound to the term issued caller->callee. Unification uses respective terms to resolve variables in their own call context
- [ ] add more tests for grammar
- [ ] add tests for unification

__2020-06-22__

Clear up terminology to be able to name the parser rule accordingly

- [x] understand basic terminolgy
- [x] term is the driving term ;) for the syntax
- [x] a term can be an atom, a variable, a number or a compound term
- [x] compound terms are either prefix where the leading atom is called functor or
- [x] repository needs baseline to be loaded (including petit parser)
- [ ] understand compound terms (Xfix notation)

__2020-06-20__

Starting all over. After the prolog class I need to clarify terminology. Prolog tends to have a lot of terms to describe things on different axes. Insights collected so far (if checked I think the code can do this already):

- [ ] understand basic terminolgy

Links:
- [ISO Standard](https://www.iso.org/standard/21413.html)
