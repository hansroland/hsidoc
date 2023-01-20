{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module PostorderMultiple (postorderMultiple) where

import HasseTemplate(template)

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine
import qualified Data.IntMap as Map


labels :: Map.IntMap String
labels = Map.fromList
        [(1,"10"), (2,"3"), (3,"6"), (4,"9"), (5,"1, 4"), (6,"2, 7"), (7,"5, 8")]

postorderMultiple :: Diagram B
postorderMultiple = template labels
