{-# LANGUAGE CPP #-}

{- |
Module      : Verifier.SAW
Copyright   : Galois, Inc. 2012-2015
License     : BSD3
Maintainer  : jhendrix@galois.com
Stability   : experimental
Portability : non-portable (language extensions)

Provides utility functions about general data structured used by SAW.
Declarations here should refer primarily to terms defined in other packages.
SAW-specific declarations should be stored in separate modules.
-}
module Verifier.SAW.Utils
  ( internalError
  , panic
  , sumBy
  ) where

import Data.Foldable

sumBy :: (Foldable t, Num b) => (a -> b) -> t a -> b
sumBy f = foldl' fn 0
  where fn e v = e + f v

internalError :: String -> a
internalError msg = error $ "internal: " ++ msg

panic :: String -> [String] -> a
panic x xs = error (unlines (x : xs))
