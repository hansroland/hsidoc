{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module TriangleHasse (triangleStruct) where

import HasseTemplate(template)

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine
import qualified Data.IntMap as Map

-- Define the labels for this drawing
labels :: Map.IntMap String
labels = Map.fromList
        [(1,"T"), (2,"a"), (3,"b"), (4,"c"), (5,"C"), (6,"B"), (7,"A")]

triangleStruct :: Diagram B
triangleStruct = template labels
