{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Algo05H (algo05h) where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine ( B, mainWith )
import qualified Data.IntMap as Map

template :: Map.IntMap String -> Diagram B
template textmap  = (poly === strutY 1 === edges === strutY 1 === vertices)
         # applyAll [lw 2 (lc red (connectOutside j k)) |
            (j,k) <- [(1,3), (1,4), (3,5), (3,7), (4,6), (4,7)]:: [(Int,Int)]]
         # applyAll [lw 3 (lc yellow (connectOutside j k)) |
            (j,k) <- [(3,5)]:: [(Int,Int)]]
         # applyAll [lw 4 (lc blue (connectOutside j k)) |
            (j,k) <- [(1,2), (2,5), (2,6)]:: [(Int,Int)]]

  where
    node key color = text (textmap Map.! key) # fontSizeL 0.5 # fc black
            <> roundedRect 2 1 0.5 # fc color # named key
    poly     = centerX $ node  1 lightblue
    edges    = centerX $ hcat [node 2 blue, sp, node 3 orange, sp, node 4  orange]
    vertices = centerX $ hcat [node 5 yellow, sp, node 6 lightgreen, sp, node 7 lightgreen]
    sp       = strutX 1

-- Define the labels for this drawing
labels :: Map.IntMap String
labels = Map.fromList
        [(1,"-0+ *"), (2,"0"), (3,""), (4,"0+"), (5,"0"), (6,"0"), (7,"+")]

algo05h :: Diagram B
algo05h = template labels

main :: IO ()
main = mainWith $ algo05h
