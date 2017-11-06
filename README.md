[![Build Status](https://travis-ci.org/joommf/conda-install.svg?branch=master)](https://travis-ci.org/joommf/conda-install)

# conda install

Jupyter OOMMF can be installed via conda. The basic steps are:

- install Anaconda (use "miniconda" if you are short of disk space). See for example https://docs.anaconda.com/anaconda/install/ for details

- run the following command to install Jupyter OOMMF

<pre>
    conda install -c conda-forge oommfc
</pre>


- you will also want to install the Jupyter Notebooks
<pre>
    conda install notebook
</pre>

  and maybe other python packages you want to use.


We are working on a conda package with name 'joommf' which will
install the notebook automatically.



## Which version of OOMMF is provided?

On Linux and OS X, the conda-forge install (as described above) provides oommfc compile from the sources available in http://github.com/fangohr/oommf/ . These include the bulkDMI OOMMF extension.

On Windows, the conda-forge install (as describe above) provides the OOMMF as is distributed from NIST (see https://github.com/conda-forge/oommf-feedstock/blob/master/recipe/meta.yaml#L10).




