module Life where

import Data.Array.Repa
import Data.Array.Repa.Stencil
import Data.Array.Repa.Stencil.Dim2

data Grid = Grid
    { unBoard  :: Array U DIM2 Int
    }

tick :: Grid -> Grid
tick = undefined

play :: Grid -> Int -> Grid
play = applyN tick

applyN :: (a -> a) -> a -> Int -> a
applyN = applyN' id

-- tail recursive function (with continuation pasing style)
applyN' :: (a -> a) -> (a -> a) -> a -> Int -> a
applyN' k f a 0 = k a
applyN' k f a i = applyN' (f . k) f a (i - 1)
