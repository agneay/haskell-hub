import DirectedGraph
import GraphADT
import UndirectedGraph

main :: IO ()
main = do
  let g1 = addEdge (addNode emptyGraph 1) (1, 2) :: DirectedGraph
  print (neighbors g1 1) -- [2]
  let g2 = addEdge (addNode emptyGraph 1) (1, 2) :: UndirectedGraph
  print (neighbors g2 1) -- [2]
  print (neighbors g2 2) -- [1]