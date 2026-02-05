# Empty list or non empty list as Recursive Multipointed Structure

Since GADTs can accurately represent the type differences between the cases n=0 (no point) and n=1 (single-pointed) in Haskell, providing arity-dependent structure at the type level, the following notation for a list term is possible:

Cons {head = 1, tail = Cons {head = 5, tail = null }} : List Int

Where the list term Cons {head = 1, tail = Cons {head = 5, tail = null }} : List Int and its null tails can be represented using n=0 (unpointed) for empty lists and n=1 (single-pointed) for cons cells within the C_multi category framework shown at https://mathoverflow.net/questions/254605.

This means that the list appears as Recursive Multipointed Structure.

Non-empty lists are single-pointed objects in C_{/*} (n=1): a cons cell Cons h t carries the underlying list object t :: List a equipped with a distinguished "head" point h :: a via the basepoint inclusion head :: * → List a. The empty list null is unpointed (n=0) in C itself—no basepoint structure exists.​

Adapting the accumulator logic to handle arity invariants at the type level:

The original code reverses standard lists [a] efficiently via tail recursion and an accumulator. The GADT ListArity encodes lists with arity ("pointedness"): Zero for the unpointed empty list (Null), One for pointed lists (Cons prepends a head to any arity tail):

{-# LANGUAGE GADTs, DataKinds, KindSignatures #-}

module ListAppearsAsRecursiveMultipointedStructure where

-- Combined logic with reverse. 

The "reverse" algorithm sequentially "bites off" the head from the list and appends it to the result. The typing ListArityimposes a hard constraint: a list can either be empty ( Zero) or have at least one element ( One). However, Consit always returns ListArity One, regardless of the input. This turns the type into an "empty/non-empty" indicator:

How to combine logic.
To adapt the function reverseto this GADT, we need to take into account that the result type will depend on the input type. If we reverse a non-empty list, we are guaranteed to get a non-empty one. 

• Stability : Experimental. I invite you to coauthorship the completion of this project.

• Maintainer : retablies@hotmail.com
