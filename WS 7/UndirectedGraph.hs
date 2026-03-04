module UndirectedGraph
  ( UndirectedGraph,
    emptyGraph,
    addNode,
    addEdge,
    neighbors,
  )
where

import Data.Map qualified as M
import GraphADT

newtype UndirectedGraph = UG (M.Map Node [Node])

instance Graph UndirectedGraph where
  emptyGraph = UG M.empty

  addNode (UG adj) n =
    UG (M.insertWith (\_ old -> old) n [] adj)

  addEdge (UG adj) (u, v) =
    UG
      ( M.insertWith
          (++)
          u
          [v]
          (M.insertWith (++) v [u] adj)
      )

  neighbors (UG adj) n =
    M.findWithDefault [] n adj