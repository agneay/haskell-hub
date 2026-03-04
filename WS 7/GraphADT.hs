module GraphADT
  ( Node,
    Edge,
    Graph (..),
  )
where

type Node = Int

type Edge = (Node, Node)

-- Typeclass defining graph interface
class Graph g where
  emptyGraph :: g
  addNode :: g -> Node -> g
  addEdge :: g -> Edge -> g
  neighbors :: g -> Node -> [Node]