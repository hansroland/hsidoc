{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}

module TriangleGeom (triangleGeom) where

import GeomTemplate

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

verts1 = [("A", 0.6, lightgreen ), ("B", 0.6, lightgreen), ("C", 0.6, lightgreen)]

edges1 = edges trail1 edglabs1

edglabs1 = [("c",1.4, 0.7, 0.6),  ("b",1.4, 0.7, 0.6), ("a", 1.4, 0.7, 0.6)]

triangleGeom :: Diagram B
triangleGeom = text "T" # fontSizeL 0.6 # fc black # translateX 1.2
   <> edges1
   <> vertices trail1 verts1 <> stroke trail1 # lc orange # lw 3 # fc lightblue

main :: IO ()
main = mainWith $ triangleGeom
