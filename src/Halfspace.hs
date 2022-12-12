{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Halfspace (halfspace) where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

negVert = map p2 $ [(0.4, 0), (0.6, 1), (0,1), (0,0), (0,4)]
posVert = map p2 $ [(0.4, 0), (0.6, 1), (1,1), (1,0), (0,4)]

hNeg :: Diagram B
hNeg = fromVertices negVert # strokeLoop
         # fc pink # lc pink

hPos :: Diagram B
hPos = fromVertices posVert # strokeLoop
         # fc lightgreen lc lightgreen

-- labCircle :: String -> Diagram B
labCircle :: String -> Colour Double -> Diagram B
labCircle nm col = text nm # fontSizeL 0.04 # fc black
      <> circle 0.04 # fc col

plus :: Diagram B
plus = moveTo (0.33 ^& 0.5) $ labCircle "+" lightgreen

minus :: Diagram B
minus = moveTo ((-0.15) ^& 0.5) $ labCircle "-" pink

line :: Diagram B
line = (fromVertices $ (0.0 ^& 0) ~~  (0.2 ^&  1)) # fc black # lw thick

littleArrow :: Diagram B
littleArrow =  arrowAt (0.1 ^&  0.5) (0.1 ^& (-0.02))

halfspace :: Diagram B
halfspace = plus <> minus <> line <> littleArrow <> hNeg <> hPos

main :: IO()
main = mainWith halfspace
