{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module TriangleGeom (triangleGeom) where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

-- triapoly :: Diagram B
trail :: (Floating n, Ord n) => Located (Trail V2 n)
trail = polyTrail ( with
        & polyType .~ PolySides
            [80@@ deg, 30@@deg ]
            [4, 7] )

-- The triangle as we know it from Geometry
triangleGeom :: Diagram B
triangleGeom = text "T" # fontSizeL 0.4 # fc black
         <> edges
         <> stroke trail # fc lightblue # lc orange # lw 3

-- A single vertex
vertex :: String -> Diagram B
vertex nm = text nm # fontSizeL 0.4 # fc black
      <> circle 0.4 # fc lightgreen  # named nm

-- The edges
edges :: Diagram B
edges = atPoints midpoints (map edgelabel ["c", "b", "a"]) <>
        (atPoints (trailVertices trail) (map vertex ["A", "B", "C"]))
  where
    edgelabel :: String -> Diagram B
    edgelabel nm = text nm # fontSizeL 0.4 # fc orange
        <> square 0.5 # fc white # named nm # lc orange
    midpoints :: (Floating n, Ord n) => [Point V2 n]
    midpoints = [(x + y) / 2 | x <- points, y <- points, x < y]
    points = trailVertices trail

main :: IO ()
main = mainWith $ triangleGeom
