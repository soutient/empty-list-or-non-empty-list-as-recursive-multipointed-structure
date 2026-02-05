-- ListAppearsAsRecursiveMultipointedStructure.hs
------------------------------------------------------------------
{-# LANGUAGE GADTs, DataKinds, KindSignatures #-}

module ListAppearsAsRecursiveMultipointedStructure where

-- The original structure
data Arity = Zero | One 
data ListArity (n :: Arity) a where 
    Null :: ListArity Zero a                       -- n=0: unpointed empty
    Cons :: a -> ListArity n a -> ListArity One a  -- n=1: pointed cons

-- Combined logic with reverse
reverseArity :: ListArity n a -> ListArity n a
reverseArity list = case list of
    Null       -> Null
    Cons h t   -> reverse' t (Cons h Null)         -- Start with a singleton (Arity One).
  where
-- The helper function only works with non-empty accumulators.
    reverse' :: ListArity any a -> ListArity One a -> ListArity One a
    reverse' Null acc = acc
    reverse' (Cons h t) acc = reverse' t (Cons h acc)

