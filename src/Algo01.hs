{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Algo01 (algo01) where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

-- triapoly :: Diagram B
trail :: (Floating n, Ord n) => Located (Trail V2 n)
trail = polyTrail ( with
        & polyType .~ PolySides
            [80@@ deg, 30@@deg ]
            [4, 7] )

-- The triangle as we know it from Geometry
algo01 :: Diagram B
algo01 = line
         <> text "T" # fontSizeL 0.6 # fc black
         <> littleArrow
         -- <> edges
         <> stroke trail # fc lightblue # lc orange # lw 3

-- A single vertex
vertex :: String -> Diagram B
vertex nm = text nm # fontSizeL 0.6 # fc black
      <> circle 0.6 # fc lightgreen  # named nm

-- The edges
edges :: Diagram B
edges = atPoints midpoints (map edgelabel ["c", "b", "a"])
        -- (atPoints (trailVertices trail) (map vertex ["A", "B", "C"]))
        -- (atPoints (trailVertices trail) (map vertex ["A", "B", "C"]))
  where
    edgelabel :: String -> Diagram B
    edgelabel nm = text nm # fontSizeL 0.6 # fc orange
        <> square 0.7 # fc white # named nm # lc orange
    midpoints :: (Floating n, Ord n) => [Point V2 n]
    midpoints = [(x + y) / 2 | x <- points, y <- points, x < y]
    points = trailVertices trail

line :: Diagram B
line = (fromVertices $ ((-3.9) ^&  (-3)) ~~  (2.2 ^&  3)) # lc red # lw thick

littleArrow :: Diagram B
littleArrow =  arrowAt ((- 1.0) ^&  (-0.1)) (0.4 ^& (-0.4))

main :: IO ()
main = mainWith $ algo01
