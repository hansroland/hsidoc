{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Preorder (preorder)  where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine ( B, mainWith )
import PreorderMultiple ( preorderMultiple )
import PreorderSingle ( preorderSingle )

preorder  :: Diagram B
preorder = alignT preorderSingle ||| strutX 3 ||| alignT preorderMultiple