{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Main where

import HsiExamples
import Hasse(hasse)
import Preorder(preorder)
import Postorder(postorder)
import Halfspace (halfspace)
import Intersect (intersect)
import Algo01 ( algo01 )
import Algo02 ( algo02 )
import Algo03 ( algo03 )

import Diagrams.Backend.SVG.CmdLine ( mainWith )
import System.Environment ( withArgs )

main :: IO ()
main = do
    withArgs ["-ohsiexamples.svg", "-w 700", "-h 200"] $
        mainWith hsiExamples
    withArgs ["-oPostorder.svg", "-w 700", "-h 200"] $
        mainWith postorder
    withArgs ["-oPreorder.svg", "-w 700", "-h 200"] $
        mainWith preorder
    withArgs ["-oHalfspace.svg", "-w 200", "-h 200"] $
        mainWith halfspace
    withArgs ["-oIntersect.svg", "-w 200", "-h 200"] $
        mainWith intersect
    withArgs ["-oHasse.svg", "-w 700", "-h 200"] $
        mainWith hasse
    withArgs ["-oAlgo01.svg", "-w 300", "-h 200"] $
        mainWith algo01
    withArgs ["-oAlgo02.svg", "-w 300", "-h 200"] $
        mainWith algo02
    withArgs ["-oAlgo03.svg", "-w 300", "-h 200"] $
        mainWith algo03

