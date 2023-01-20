{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Algo01 (algo01) where

import GeomTemplate

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

verts1 = [("", 0.01, lightgreen ), ("", 0.01, lightgreen), ("", 0.01, lightgreen)]

algo01 :: Diagram B
algo01 = text "T" # fontSizeL 0.6 # fc black # translateX 1.2
   <> line
   <> vertices trail1 verts1 <> stroke trail1 # lc orange # lw 3 # fc lightblue

main :: IO ()
main = mainWith $ algo01
