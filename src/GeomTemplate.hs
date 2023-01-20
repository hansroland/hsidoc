{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module GeomTemplate where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine
import qualified Data.IntMap as Map
import Diagrams.Trail

-- see: https://archives.haskell.org/projects.haskell.org/diagrams/doc/manual.html#essential-concepts

pt1 :: (Coordinates c, Num (PrevDim c), Num (FinalCoord c)) => c
pt1 = (4 ^& (-2))

pt2 :: (Coordinates c, Num (PrevDim c), Num (FinalCoord c)) => c
pt2 = (2 ^& 2)

pt3 :: (Coordinates c, Num (PrevDim c), Num (FinalCoord c)) => c
pt3 = ((-6)^&(-2))

pt4 :: (Coordinates c, Num (PrevDim c), Num (FinalCoord c)) => c
pt4 = ((-2)^&(-2))

edge1c :: Diagram B
edge1c = (fromVertices $ (pt1) ~~  pt2) # lc orange # lw thick

edge1b :: Diagram B
edge1b = (fromVertices $ (pt1) ~~  pt3) # lc orange # lw thick

edge2b :: Diagram B
edge2b = (fromVertices $ (pt1) ~~  pt4) # lc orange # lw thick

trail1 :: Located (Trail' Loop V2 Double)
trail1 = fromVertices [pt1, pt2, pt3, pt1]

trail2 :: Located (Trail' Loop V2 Double)
trail2 = fromVertices [pt1, pt2, pt4, pt1]

vertices :: Located (Trail' Loop V2 Double) -> [(String, Double, Colour Double)] -> Diagram B
vertices tr vts = atPoints (loopVertices tr) (map vertex vts)
  where

-- vertex :: (String, Double, ColorDouble) -> Diagram B
vertex (nm, sz, color) = text nm # fontSizeL sz # fc black
      <> circle sz  # fc color

line :: Diagram B
line = (fromVertices $ ((-3) ^&  (-3)) ~~  (3 ^& 3)) # lc red # lw thick
        <> arrowAt (0 ^& 0) (0.4 ^& (-0.4))


-- edges :: Diagram B
edges trail lbls = atPoints midpoints $ map edgelabel lbls
  where
    edgelabel :: (String, Double, Double, Double) -> Diagram B
    edgelabel (nm,l,b,f) = text nm # fontSizeL f # fc orange
        <> rect l b # fc white # named nm # lc orange
    midpoints ::  [Point V2 Double]
    midpoints = [y + (x - y) * 0.45 | x <- points, y <- points, x < y]
    points = loopPoints trail
