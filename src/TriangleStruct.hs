{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module TriangleStruct (triangleStruct) where

import TriangleTemplate(template)

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine
import qualified Data.IntMap as Map


labels :: Map.IntMap String
labels = Map.fromList
        [(1,"T"), (2,"a"), (3,"b"), (4,"c"), (5,"C"), (6,"B"), (7,"C")]

triangleStruct :: Diagram B
triangleStruct = template labels

{-
triangleStruct :: Map.IntMap String -> Diagram B
triangleStruct textmap = (poly === strutY 1 === edges === strutY 1 === vertices)
         # applyAll [connectOutside j k |
            (j,k) <- [(1,2), (1,3), (1,4), (2,5), (2,6), (3,5), (3,7), (4,6), (4,7)]:: [(Int,Int)]]
  where
    node key color = text (textmap Map.! key) # fontSizeL 0.5 # fc black
            <> roundedRect 2 1 0.5 # fc color # named key
    poly     = strutX 4 ||| node  1 lightblue
    edges    = node 2  orange  ||| strutX 1 ||| node 3  orange ||| strutX 1 ||| node 4  orange
    vertices = node 5 lightgreen ||| strutX 1 ||| node 6  lightgreen ||| strutX 1 ||| node 7 lightgreen
-}


main :: IO ()
main = mainWith $ template labels
