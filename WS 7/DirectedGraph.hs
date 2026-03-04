module DirectedGraph
  ( DirectedGraph,
    emptyGraph,
    addNode,
    addEdge,
    neighbors,
  )
where

import Data.Map qualified as M
import GraphADT

-- Internal representation hidden
newtype DirectedGraph = DG (M.Map Node [Node])

instance Graph DirectedGraph where
  emptyGraph = DG M.empty

  addNode (DG adj) n =
    DG (M.insertWith (\_ old -> old) n [] adj)

  addEdge (DG adj) (u, v) =
    DG (M.insertWith (++) u [v] adj)

  neighbors :: DirectedGraph -> Node -> [Node]
  neighbors (DG adj) n =
    M.findWithDefault [] n adj