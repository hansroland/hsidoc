{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Hasse (hasse)  where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine ( B, mainWith )
import TriangleGeom ( triangleGeom )
import TriangleHasse ( triangleStruct )

hasse  :: Diagram B
hasse = alignT triangleGeom ||| strutX 3 ||| alignT triangleStruct
