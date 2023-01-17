{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Algo03 (algo03) where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

-- triapoly :: Diagram B
trail :: (Floating n, Ord n) => Located (Trail V2 n)
trail = polyTrail ( with
        & polyType .~ PolySides
            [80@@ deg, 30@@deg ]
            [4, 7] )

-- The triangle as we know it from Geometry
algo03 :: Diagram B
algo03 = line
         <> text "-0+" # fontSizeL 0.6 # fc black
         <> littleArrow
         <> vertices
         <> edges
         <> remainingSides
         <> stroke trail # fc lightblue

-- A single vertex
vertex :: (String, Double) -> Diagram B
vertex (nm,r) = text nm # fontSizeL r # fc black
      <> circle r # fc lightgreen  # named nm

vertices :: Diagram B
vertices = (atPoints (trailVertices trail) (map vertex [("+", 0.6), ("0", 0.6), ("C",0.01)]))


-- The edges
edges :: Diagram B
edges = atPoints midpoints (map edgelabel [("0+",1.4, 0.7, 0.6),  ("-+",1.4, 0.7, 0.6), ("", 0.01, 0.01, 0.01)])
  where
    edgelabel :: (String, Double, Double, Double) -> Diagram B
    edgelabel (nm,l,b,f) = text nm # fontSizeL f # fc orange
        <> rect l b # fc white # named nm # lc orange
    midpoints :: (Floating n, Ord n) => [Point V2 n]
    midpoints = [(x + y) / 2 | x <- points, y <- points, x < y]
    points = trailVertices trail


line :: Diagram B
line = (fromVertices $ ((-3.9) ^&  (-3)) ~~  (2.2 ^&  3)) # lc red # lw thick

littleArrow :: Diagram B
littleArrow =  arrowAt ((- 1.0) ^&  (-0.1)) (0.4 ^& (-0.4))


triang :: Diagram B
triang = stroke trail # fc lightblue # lc orange # lw 3

explodedTrail :: (Floating n, Ord n) => [Located (Trail V2 n)]
explodedTrail = trail # explodeTrail

explodedDiags :: [Diagram B]
explodedDiags = fmap stroke explodedTrail

remainingSides :: Diagram B
remainingSides = explodedDiags
            # zipWith lc [orange, lightblue, orange]
            # zipWith lw [3,1,3]
            # mconcat

main :: IO ()
main = mainWith $ algo03
