{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Algo03G (algo03g) where

import GeomTemplate
import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

verts1 = [("+", 0.6, lightgreen ), ("0", 0.6, lightgreen), ("-", 0.01, lightgreen)]

edges1 = edges trail1 edglabs1

edglabs1 = [("0+",1.4, 0.7, 0.6),  ("+-",1.4, 0.7, 0.6), ("-0", 0.01, 0.01, 0.01)]

algo03g :: Diagram B
algo03g =  vertices trail1 verts1
    <> line
    <> text "-0+" # fontSizeL 0.6 # fc black # translateX 1.2
    <> edges1
    <> edge1b <> edge1c
    <> stroke trail1 # lc lightblue # lw thin # fc lightblue

main :: IO ()
main = mainWith $ algo03g
