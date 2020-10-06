# PL-bipartite-clustering
Pseudo-likelihood (PL) bipartite clustering (+ spectral clustering)

Run `test_real_data.m`. The code implements the following:
- `biSpecClust3`: Laplacian-type spectral clustering as discussed in the following paper: [Matched Bipartite Block Model with Covariates, by Razaee, Amini and Li](https://www.google.com/url?q=https://www.jmlr.org/papers/volume20/17-153/17-153.pdf&sa=D&source=hangouts&ust=1602029972201000&usg=AFQjCNHUwy6Xt0RfD_fXN-ZGZYMvOrREGQ)
- `biSpecClustDR`: Data-driven spectral clustering as discussed here. This code is borrowed from the [bipartite-spectral-clustering repo](https://github.com/zhixin0825/bipartite-spectral-clustering).
- `PLEM`: The PL-EM iterations for improving intial labels as discussed here.
