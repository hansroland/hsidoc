{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module PreorderSingle (preorderSingle) where

import TriangleTemplate(template)

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine
import qualified Data.IntMap as Map


labels :: Map.IntMap String
labels = Map.fromList
        [(1,"1"), (2,"2"), (3,"5"), (4,"7"), (5,"3"), (6,"4"), (7,"6")]

preorderSingle :: Diagram B
preorderSingle = template labels
