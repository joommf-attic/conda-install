PYTHON?=python3

# install joommf via conda
build-docker-conda:
	docker build -t joommfimage-conda .

build-docker:
	make build-docker-conda

test:
	pwd
	ls -l
	oommf +version

	$(PYTHON) -c "import sys; import oommfodt as m; sys.exit(m.test())"
	$(PYTHON) -c "import sys; import joommfutil as m; sys.exit(m.test())"
	$(PYTHON) -c "import sys; import discretisedfield as d; sys.exit(d.test())"
	$(PYTHON) -c "import sys; import micromagneticmodel as m; sys.exit(m.test())"
	$(PYTHON) -c "import sys; import oommfc as m; sys.exit(m.test())"
	@# We haven't got a joommf conda package yet
	@# $(PYTHON) -c "import sys; import joommf"


travis-build:
	make build-docker
	docker run --rm -e ci_env joommfimage-conda make test
