{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Algo02G (algo02g) where

import GeomTemplate

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

verts1 = [("+", 0.6, lightgreen ), ("0", 0.6, lightgreen), ("-", 0.6, lightgreen)]

edges1 = edges trail1 edglabs1

edglabs1 = [("0+",1.4, 0.7, 0.6),  ("+-",1.4, 0.7, 0.6), ("-0", 1.4, 0.7, 0.6)]

algo02g :: Diagram B
algo02g =  vertices trail1 verts1
    <> line
    <> text "-0+" # fontSizeL 0.6 # fc black # translateX 1.2
    <> edges1
    <> stroke trail1 # lc orange # lw 3 # fc lightblue

main :: IO ()
main = mainWith $ algo02g
