{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module PreorderMultiple (preorderMultiple) where

import HasseTemplate(template)

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine
import qualified Data.IntMap as Map

-- Define the labels for this drawing
labels :: Map.IntMap String
labels = Map.fromList
        [(1,"1"), (2,"2"), (3,"5"), (4,"8"), (5,"3, 6"), (6,"4, 9"), (7,"7, 10")]

preorderMultiple :: Diagram B
preorderMultiple = template labels
