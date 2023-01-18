{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Algo02 (algo02)  where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine ( B, mainWith )
import Algo02G ( algo02g )
import Algo02H ( algo02h )

algo02  :: Diagram B
algo02 = alignT algo02g ||| strutX 3 ||| alignT algo02h