{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Intersect (intersect, hs1, hs2, hs3)  where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine
import Data.Colour

-- Define point sets for 3 halfspace regions
ps1 = map p2 $ [(0, 0), (1, 0.2), (1,1), (0,1), (0,0)]
ps2 = map p2 $ [(0, 0), (0.3, 1), (0.8,1), (0.8,0), (0,0)]
ps3 = map p2 $ [(0, 0), (1, 0), (0.2, 1), (0,1), (0,0) ]

-- Extract the points that define the
droptake2 :: Int -> [a] -> [a]
droptake2 drp xs = take 2 $ drop drp xs

-- calculate the arrowpoints at the middle of the halfspace lines
ap vs = scale 0.5 $ head vs + last vs

ap1 = ap $ droptake2 0 ps1
ap2 = ap $ droptake2 0 ps2
ap3 = ap $ droptake2 1 ps3

ar1 = arrowAt ap1 ((-0.016) ^&  0.08)
ar2 = arrowAt ap2 (0.08 ^& (-0.024))
ar3 = arrowAt ap3 ((-0.08) ^& (-0.064))

-- Create halfspaces
hs :: [P2 Double] -> Diagram B
hs ps  = fromVertices ps # strokeLoop
         # fcA (withOpacity green 0.3 )  # lc lightgreen

-- The black lines along the halfspace
-- ln :: Diagram B
ln lp = fromVertices lp # fc black # lw thin

lp1 = (0 ^& 0) ~~ (1 ^& 0.2)
lp2 = (0 ^& 0) ~~ (0.3 ^& 1)
lp3 = (1 ^& 0) ~~ (0.2 ^& 1)

-- pimp up halfspaces with the lines and arrows
hs1 = ln lp1 <> ar1 <> hs ps1
hs2 = ln lp2 <> ar2 <> hs ps2
hs3 = ln lp3 <> ar3 <> hs ps3

intersect :: Diagram B
intersect = hs1 <> (moveTo (p2 (0.2, 0)) hs2) <> hs3


