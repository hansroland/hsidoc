{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Main where

import Hasse(hasse)
import Preorder(preorder)
import Postorder(postorder)
import Halfspace (halfspace)
import Intersect (intersect)

import Diagrams.Backend.SVG.CmdLine ( mainWith )
import System.Environment ( withArgs )

main :: IO ()
main = do
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

