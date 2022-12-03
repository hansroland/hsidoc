{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Main where


import TriangleGeom(triangleGeom)
import TriangleStruct(triangleStruct)

import Diagrams.Backend.SVG.CmdLine ( mainWith )
import System.Environment ( withArgs )



main :: IO ()
main = do
    withArgs ["-o TriangleGeom.svg", "-w 400", "-h 400"] $
        mainWith triangleGeom
    withArgs ["-o TriangleStruct.svg", "-w 400", "-h 400"] $
        mainWith triangleStruct



