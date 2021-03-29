{-# LANGUAGE DataKinds #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE ScopedTypeVariables #-}

-- This is unfinished exploration. I'm not even sure I'm on the right path.

import Data.Array.Unboxed
import GHC.TypeLits

-- data Vec2 (size::Nat)
newtype Vec (size :: Nat) val = Vec (UArray Int val)

hi :: Vec size Double -> Double
hi (Vec a) = a ! 1

main =
  let a = Vec (array (0, 1) [(0, 1.5), (1, 2.0)] :: UArray Int Double)
  in putStrLn (show (hi a))
