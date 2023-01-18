{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Algo02H (algo02h) where

import TriangleTemplate(template)

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine
import qualified Data.IntMap as Map

-- Define the labels for this drawing
labels :: Map.IntMap String
labels = Map.fromList
        [(1,"-0+"), (2,"-0"), (3,"-+"), (4,"0+"), (5,"-"), (6,"0"), (7,"+")]

algo02h :: Diagram B
algo02h = template labels
