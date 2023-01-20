{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module HasseTemplate (template) where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine ( B, mainWith )
import qualified Data.IntMap as Map

template :: Map.IntMap String -> Diagram B
template textmap = (poly === strutY 1 === edges === strutY 1 === vertices)
         # applyAll [lc red (connectOutside j k) |
            (j,k) <- [(1,2), (1,3), (1,4), (2,5), (2,6), (3,5), (3,7), (4,6), (4,7)]:: [(Int,Int)]]
  where
    node key color = text (textmap Map.! key) # fontSizeL 0.5 # fc black
            <> roundedRect 2 1 0.5 # fc color # named key
    poly     = centerX $ node  1 lightblue
    edges    = centerX $ hcat [node 2  orange, sp, node 3  orange, sp, node 4  orange]
    vertices = centerX $ hcat [node 5 lightgreen, sp, node 6  lightgreen, sp, node 7 lightgreen]
    sp       = strutX 1
