Prolog
------

Another attempt to start a project that has low odds of being finished ever. This is my trial of understanding and implementing a prolog interpreter. I try to keep my struggles not only in code but also in this readme. 

2020-06-20
----------

Starting all over. After the prolog class I need to clarify terminology. Prolog tends to have a lot of terms to describe things on different axes. Insights collected so far (if checked I think the code can do this already):

- [x] term is the driving term ;) for the syntax
- [x] a term can be an atom, a variable, a number or a compound term
- [x] compound terms are either prefix where the leading atom is called functor or
- [] are infix, postfix, etc. Operators in prolog are special entities with configuration of Xfix notation and precedence
- [] so my conclusion is to start with petit parser that can parse a family tree knowledgebase
Links:

- [ISO Standard](https://www.iso.org/standard/21413.html)
