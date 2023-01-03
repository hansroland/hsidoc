{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Postorder (postorder)  where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine ( B, mainWith )
import PostorderMultiple ( postorderMultiple )
import PostorderSingle ( postorderSingle )

postorder  :: Diagram B
postorder = alignT postorderSingle ||| strutX 3 ||| alignT postorderMultiple