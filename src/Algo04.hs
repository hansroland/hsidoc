{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Algo04 (algo04)  where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine ( B, mainWith )
import Algo04G ( algo04g )
import Algo04H ( algo04h )

algo04  :: Diagram B
algo04 = alignT algo04g ||| strutX 3 ||| alignT algo04h