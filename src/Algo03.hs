{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Algo03 (algo03)  where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine ( B, mainWith )
import Algo03G ( algo03g )
import Algo03H ( algo03h )

algo03  :: Diagram B
algo03 = alignT algo03g ||| strutX 3 ||| alignT algo03h

main :: IO ()
main = mainWith $ algo03
