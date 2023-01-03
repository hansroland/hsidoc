{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}
{-# LANGUAGE OverloadedStrings         #-}
{-# LANGUAGE ScopedTypeVariables         #-}

module HsiExamples where

import Prelude hiding (FilePath)
import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine ( B, mainWith )
import Diagrams.SVG.ReadSVG
import Diagrams.SVG.Attributes
import Diagrams.TwoD.Offset
import System.Environment
import Filesystem.Path.CurrentOS
import Diagrams.TwoD.Input

hsiExamples :: IO (Diagram B)
hsiExamples = do
    dia1 <- wrappedReadSVG "inputsvg/okta.svg"
    dia2 <- wrappedReadSVG "inputsvg/davidit.svg"
    dia3 <- wrappedReadSVG "inputsvg/diamond0.svg"
    dia4 <- wrappedReadSVG "inputsvg/diamond1.svg"
    return $ dia1 ||| strutX 5 ||| dia2 ||| strutX 5 ||| dia3 ||| strutX 5 ||| dia4

wrappedReadSVG :: FilePath -> IO (Diagram B)
wrappedReadSVG fp = do
    diagramFromSVG :: Either String (Diagram B) <- readSVGFile fp
    case diagramFromSVG of
        Left str -> error $ "diagramFromSVG '" <> show fp <> "' returned " <> str
        Right d  -> return d
