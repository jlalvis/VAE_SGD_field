## Inversion with VAE and stochastic gradient descent using an assembled prior.
This is the code associated to the manuscript **Geophysical Inversion Using a Variational Autoencoder to Model an Assembled Spatial Prior Uncertainty** which may be found [here](https://agupubs.onlinelibrary.wiley.com/doi/abs/10.1029/2021JB022581). An `environment.yml` file is provided and may be used as:

>conda env create -f environment.yml

to install the needed dependencies. Note that if you use pytorch with a GPU it sometimes works better to use the `-c pytorch` channel.

Once the dependencies are installed, you may install the code and run the synthetic and field cases in the manuscript available in each of the jupyter notebooks (.ipynb). The GPR cross-borehole dataset for the field case is available [here](https://doi.pangaea.de/10.1594/PANGAEA.934056), just download the file 'MOG.txt' and put it in the top folder.

A brief explanation of contents:
- The notebooks `VAE_SGD_nonlinear_synthetic.ipynb` and `VAE_SGD_nonlinear_field.ipynb` run the inversions once the DGMs are trained (they read the trained VAE from a parameter file with extension '.pth').
- `getSensTMatVecbatch.jl` : is a julia module needed to compute the sensitivity product for a data batch. It is a modified version from `getSensTMatVec.jl`.
- `zinit_d40s100.npy` : contains a set of 100 initial vectors of 40 dimensions for reproducibility of results. They were generated from a 40 dimensional multivariate gaussian distribution.
- *training* : files for training and generation of VAE. The jupyter notebook `training_VAE.ipynb` is used to train the VAE. A GPU is best for lower computational time in this part. The saved parameters for the VAE trained for the assembled prior are provided in `VAE100eps40_tl2ts2.pth` for testing inversion directly. The intrafacies variability is added by means of Karhunen-Loeve expansion then the eigenvectors and eigenvalues of the covariance matrix need to be first computed with `GPsimulation_KL.ipynb`. The folder 'tilarge2_tilargesheet2' contains the 18 different TIs. If one would like to train with only one training image, one could simply point to a different directory which has only the desired TI.
