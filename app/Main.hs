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

import Diagrams.Backend.SVG.CmdLine ( mainWith )
import System.Environment ( withArgs )

main :: IO ()
main = do
    withArgs ["-o TriangleGeom.svg", "-w 400", "-h 400"] $
        mainWith triangleGeom
    withArgs ["-o TriangleHasse.svg", "-w 400", "-h 400"] $
        mainWith triangleStruct
    withArgs ["-o PostorderSingle.svg", "-w 400", "-h 400"] $
        mainWith postorderSingle
    withArgs ["-o PostorderMultiple.svg", "-w 400", "-h 400"] $
        mainWith postorderMultiple
    withArgs ["-o PreorderSingle.svg", "-w 400", "-h 400"] $
        mainWith preorderSingle
    withArgs ["-o PreorderMultiple.svg", "-w 400", "-h 400"] $
        mainWith preorderMultiple

