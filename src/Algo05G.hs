{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Algo05G (algo05g) where

import GeomTemplate

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

verts1 = [("+", 0.6, lightgreen ), ("0", 0.6, lightgreen), ("-", 0.01, lightgreen)]

edges1 = edges trail1 edglabs1

edglabs1 = [("0+",1.4, 0.7, 0.6),  ("+- *", 0.01, 0.01, 0.01), ("-0", 0.01, 0.01, 0.01)]

algo04g :: Diagram B
algo04g =  vertices trail1 verts1
    <> newVert # translateX (-2) #translateY (-2)
    <> line
    <> text "-0+ *" # fontSizeL 0.6 # fc black # translateX 1.2
    <> edges1
    <> edge2b <> edge1c
    <> stroke trail1 # lc lightblue # lw thin # fc lightblue

verts2 = [("+", 0.6, lightgreen), ("0", 0.6, lightgreen), ("0", 0.6, yellow)]

newVert = (vertex ("0", 0.6, yellow))

edges2 = edges trail2 edglabs2

edglabs2 = [("0+",1.4, 0.7, 0.6),  ("", 0.01, 0.01, 0.01), ("", 0.01, 0.01, 0.01)]

newLine :: Diagram B
newLine = (fromVertices $ pt2 ~~  pt4) # lc blue # lw thick


algo05g :: Diagram B
algo05g =  vertices trail1 verts1
    <> newVert # translateX (-2) #translateY (-2)
    <> newLine
    <> text "-0+ *" # fontSizeL 0.6 # fc black # translateX 1.2
    <> edges2
    <> edge2b <> edge1c
    <> stroke trail2 # lc lightblue # lw thin # fc lightblue
    <> stroke trail1 # opacity 0

main :: IO ()
main = mainWith $ algo05g
