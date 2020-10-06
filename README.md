# PL-bipartite-clustering
Pseudo-likelihood (PL) bipartite clustering (+ spectral clustering).

Run `test_real_data.m`. The code implements the following:
- `biSpecClust3`: Laplacian-type spectral clustering as discussed in the following paper: [Matched Bipartite Block Model with Covariates, by Razaee, Amini and Li](https://www.jmlr.org/papers/volume20/17-153/17-153.pdf) [1].
- `biSpecClustDR`: Ajdacency-based data-driven spectral clustering as discussed in the following paper: [Analysis of spectral clustering algorithms for community detection: the general bipartite setting, by Zhou and Amini](http://www.jmlr.org/papers/volume20/18-170/18-170.pdf). This code is borrowed from the [bipartite-spectral-clustering repo](https://github.com/zhixin0825/bipartite-spectral-clustering).
- `PLEM`: The PL-EM iterations for improving intial labels as discussed in the following paper: [Optimal Bipartite Network Clustering, by Zhou and Amini](http://jmlr.org/papers/volume21/19-299/19-299.pdf).

The data is from [1].
