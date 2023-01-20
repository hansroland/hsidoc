{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Algo04G (algo04g) where

import GeomTemplate
import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

verts1 = [("+", 0.6, lightgreen ), ("0", 0.6, lightgreen), ("-", 0.01, lightgreen)]

newVert = (vertex ("0", 0.6, yellow))

edges1 = edges trail1 edglabs1

edglabs1 = [("0+",1.4, 0.7, 0.6),  ("+- *",1.4, 0.7, 0.6), ("-0", 0.01, 0.01, 0.01)]

algo04g :: Diagram B
algo04g =  vertices trail1 verts1
    <> newVert # translateX (-2) #translateY (-2)
    <> line
    <> text "-0+" # fontSizeL 0.6 # fc black # translateX 1.2
    <> edges1
    <> edge2b <> edge1c
    <> stroke trail1 # lc lightblue # lw thin # fc lightblue

main :: IO ()
main = mainWith $ algo04g
