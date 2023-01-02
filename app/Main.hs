{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Main where

import TriangleGeom(triangleGeom)
import TriangleHasse(triangleStruct)
import PostorderMultiple ( postorderMultiple )
import PostorderSingle ( postorderSingle )
import PreorderMultiple ( preorderMultiple )
import PreorderSingle ( preorderSingle )
import Halfspace (halfspace)
import Intersect (intersect)

import Diagrams.Backend.SVG.CmdLine ( mainWith )
import System.Environment ( withArgs )

main :: IO ()
main = do
    withArgs ["-oTriangleGeom.svg", "-w 400", "-h 400"] $
        mainWith triangleGeom
    withArgs ["-oTriangleHasse.svg", "-w 400", "-h 400"] $
        mainWith triangleStruct
    withArgs ["-oPostorderSingle.svg", "-w 400", "-h 400"] $
        mainWith postorderSingle
    withArgs ["-oPostorderMultiple.svg", "-w 400", "-h 400"] $
        mainWith postorderMultiple
    withArgs ["-oPreorderSingle.svg", "-w 400", "-h 400"] $
        mainWith preorderSingle
    withArgs ["-oPreorderMultiple.svg", "-w 400", "-h 400"] $
        mainWith preorderMultiple
    withArgs ["-oHalfspace.svg", "-w 200", "-h 200"] $
        mainWith halfspace
    withArgs ["-oIntersect.svg", "-w 400", "-h 400"] $
        mainWith intersect

