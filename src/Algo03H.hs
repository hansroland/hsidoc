{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Algo03H (algo03h) where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine ( B, mainWith )
import qualified Data.IntMap as Map

template :: Map.IntMap String -> Map.IntMap Double -> Diagram B
template textmap opamap = (poly === strutY 1 === edges === strutY 1 === vertices)
         # applyAll [lc red (connectOutside j k) |
            (j,k) <- [(1,3), (1,4), (3,7), (4,6), (4,7)]:: [(Int,Int)]]
  where
    node key color = text (textmap Map.! key) # fontSizeL 0.5 # fc black # opacity (opa key)
            <> roundedRect 2 1 0.5 # fc color # named key # opacity (opa key)
    opa key  = opamap Map.! key
    poly     = centerX $ node  1 lightblue
    edges    = centerX $ hcat [node 2  orange, sp, node 3  orange, sp, node 4  orange]
    vertices = centerX $ hcat [node 5 lightgreen, sp, node 6  lightgreen, sp, node 7 lightgreen]
    sp       = strutX 1


-- Define the labels for this drawing
labels :: Map.IntMap String
labels = Map.fromList
        [(1,"-0+"), (2,"-0"), (3,"-+"), (4,"0+"), (5,"-"), (6,"0"), (7,"+")]

opas :: Map.IntMap Double
opas = Map.fromList
        [(1,1), (2,0), (3,1), (4,1), (5,0), (6,1), (7,1)]


algo03h :: Diagram B
algo03h = template labels opas

main :: IO ()
main = mainWith $ algo03h

