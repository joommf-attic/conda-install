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

## Problems?

### Unthreaded tk version

Symptom

<pre>
        if val.returncode is not 0:
>           raise RuntimeError("Some problem calling OOMMF.")
E           RuntimeError: Some problem calling OOMMF.
/opt/conda/lib/python3.6/site-packages/oommfc/oommf.py:58: RuntimeError
----------------------------- Captured stdout call -----------------------------
2017/11/7 11:32: Calling OOMMF (stdprobfmr/stdprobfmr.mif) ... [0.4s]
Error when executing:
	command: /opt/conda/bin/oommf boxsi +fg stdprobfmr/stdprobfmr.mif -exitondone 1
	stdout: b'Boxsi run end.\n'
	stderr: b'<364> oommf.tcl 1.2.1.0  panic:\nchild process exited abnormally\n'
</pre>

If you see output like the above, it is possible that `conda` uses its own package `tk` (from channel `default`) rather than from channel `conda-forge`. The tk on the `conda-forge` channel supports threading, which is needed for OOMMF to work. The following command should solve the problem:
<pre>
conda update -c conda-forge tk
</pre>

#### More details on diagnosing the situation for the curious minds
If you want to diagnose which tk package is installed, you can use `conda search -c conda-forge tk` and search for the lines starting with `tk`:
<pre>
tk                           8.5.13                        0  defaults
                             8.5.13                        1  defaults
                             8.5.15                        0  defaults
                             8.5.18                        0  defaults
                             8.5.19                        0  conda-forge
                             8.5.19                        1  conda-forge
                          *  8.5.19                        2  conda-forge
                             8.6.6                         0  conda-forge
                             8.6.6                         1  conda-forge
                             8.6.6                         2  conda-forge
                             8.6.6                         3  conda-forge
                             8.6.6                         4  conda-forge
                             8.6.6                         5  conda-forge
</pre>
The installed version is the one with the `*`. In the above example, this is the right package from the `conda-forge` channel (right most column).

We have tracked down this problem [here](https://github.com/joommf/joommf/issues/81#issuecomment-342483535), but haven't found a good solution yet (other than issueing the above `conda update` command manually).

## Which version of OOMMF is provided?

On Linux and OS X, the conda-forge install (as described above) provides oommfc compile from the sources available in http://github.com/fangohr/oommf/ . These include the bulkDMI OOMMF extension.

On Windows, the conda-forge install (as describe above) provides the OOMMF as is distributed from NIST (see https://github.com/conda-forge/oommf-feedstock/blob/master/recipe/meta.yaml#L10).




