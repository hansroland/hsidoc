{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Algo05 (algo05)  where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine ( B, mainWith )
import Algo05G ( algo05g )
import Algo05H ( algo05h )

algo05  :: Diagram B
algo05 = alignT algo05g ||| strutX 3 ||| alignT algo05h