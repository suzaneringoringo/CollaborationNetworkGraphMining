# membaca file sisi
edges = read.delim("data/CA-GrQc.txt", header = TRUE, sep = "\t")

# menentukan simpul dari file sisi
nodes1 <- data.frame(unique(edges$FromNodeId))
nodes2 <- data.frame(unique(edges$ToNodeId))
colnames(nodes1) <- "nodes"
colnames(nodes2) <- "nodes"
nodes <- unique(rbind(nodes1, nodes2))

# membuat graf
net <- graph_from_data_frame(d=edges, vertices=nodes, directed=F)

# menggambar graf
plot(net, edge.width=0.1,	edge.arrow.width=0, vertex.size=1, vertex.label.cex=.05)

# clustering pada graf total
netCluster <- cluster_walktrap(net)
cluster <- membership(netCluster)
cluster
plot(netCluster, net, vertex.size=3, vertex.label.cex=1)

# contoh peneliti 14872 da 1116
match(14872, unlist(nodes))
cluster[2008]
match(1116, unlist(nodes))
cluster[2004]
community_nodes = c()
for (i in 1:length(cluster)) {
  if (cluster[i] == 6) {
    community_nodes = c(community_nodes, unlist(nodes)[i])
  }
}
community_nodes
14872 %in% community_nodes
exampleFrom = c()
exampleTo = c()
for (i in 1:length(edges$FromNodeId)) {
  if (edges$FromNodeId[i] %in% community_nodes || edges$ToNodeId[i] %in% community_nodes) {
    exampleFrom = c(exampleFrom, edges$FromNodeId[i])
    exampleTo = c(exampleTo, edges$ToNodeId[i])
  }
}

exampleEdges <- data.frame(exampleFrom, exampleTo)
exampleNodes1 <- data.frame(unique(exampleEdges$exampleFrom))
exampleNodes2 <- data.frame(unique(exampleEdges$exampleTo))
colnames(exampleNodes1) <- "nodes"
colnames(exampleNodes2) <- "nodes"
exampleNodes <- unique(rbind(exampleNodes1, exampleNodes2))

exampleNet <- graph_from_data_frame(d=exampleEdges, vertices=exampleNodes, directed=F)
plot(exampleNet, edge.width=0.1,	edge.arrow.width=0, vertex.size=1, vertex.label.cex=0.8)

exampleNetCluster <- cluster_walktrap(exampleNet)
plot(exampleNetCluster, exampleNet, vertex.size=3, vertex.label.cex=1, vertex.label.dist=1)

community_nodes
