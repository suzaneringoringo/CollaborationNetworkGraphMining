edges = read.delim("data/CA-GrQc.txt", header = TRUE, sep = "\t")
nodes1 <- data.frame(unique(edges$FromNodeId))
nodes2 <- data.frame(unique(edges$ToNodeId))
colnames(nodes1) <- "nodes"
colnames(nodes2) <- "nodes"
nodes <- unique(rbind(nodes1, nodes2))

net <- graph_from_data_frame(d=edges, vertices=nodes, directed=F)

plot(net, edge.width=0.1,	edge.arrow.width=0, vertex.size=1, vertex.label.cex=.05)

exampleFrom = c()
exampleTo = c()
for (i in range(1:length(edges$FromNodeId))) {
  if (edges$FromNodeId[i] == 14872 || edges$ToNodeId == 14872) {
    exampleFrom = c(example, edges$FromNodeId[i])
    exampleTo = c(example, edges$ToNodeId[i])
    print(i)
    print(edges$FromNodeId[i])
    print(edges$ToNodeId[i])
  } else {
    if (edges$FromNodeId[i] == 1116 || edges$ToNodeId == 1116) {
      exampleFrom = c(example, edges$FromNodeId[i])
      exampleTo = c(example, edges$ToNodeId[i])
      print(i)
      print(edges$FromNodeId[i])
      print(edges$ToNodeId[i])
    }
  }
}

edges$FromNodeId[1] == 3466 || edges$ToNodeId == 3466
