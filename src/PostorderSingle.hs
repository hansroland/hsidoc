{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module PostorderSingle (postorderSingle) where

import HasseTemplate(template)

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine
import qualified Data.IntMap as Map


labels :: Map.IntMap String
labels = Map.fromList
        [(1,"7"), (2,"3"), (3,"5"), (4,"6"), (5,"1"), (6,"2"), (7,"4")]

postorderSingle :: Diagram B
postorderSingle = template labels
