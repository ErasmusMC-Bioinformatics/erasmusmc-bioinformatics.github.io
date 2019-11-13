# Settings
JEKYLL=jekyll
PORT?=4000
HOST?=0.0.0.0
FLAGS?=""
CHROME=google-chrome-stable
TUTORIALS=$(shell find _site/training-material -name 'tutorial.html' | sed 's/_site\/training-material\///')
SLIDES=$(shell find _site/training-material -name 'slides.html' | sed 's/_site\/training-material\///')
SLIDES+=$(shell find _site/training-material/*/*/slides/* | sed 's/_site\/training-material\///')
PDF_HOST?=127.0.0.1
SITE_URL=http://${PDF_HOST}:${PORT}/training-material
PDF_DIR=_pdf
REPO=$(shell echo "$${ORIGIN_REPO:-galaxyproject/training-material}")
BRANCH=$(shell echo "$${ORIGIN_BRANCH:-master}")
MINICONDA_URL=https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
SHELL=bash
RUBY_VERSION=2.4.4
CONDA_ENV=erasmusmc_bioinformatics

ifeq ($(shell uname -s),Darwin)
	CHROME=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
	MINICONDA_URL=https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
endif

CONDA=$(shell which conda)
ifeq ($(CONDA),)
	CONDA=${HOME}/miniconda3/bin/conda
endif

default: help

install-conda: ## install Miniconda
	curl $(MINICONDA_URL) -o miniconda.sh
	bash miniconda.sh -b
.PHONY: install-conda

create-env: ## create conda environment
	if ${CONDA} env list | grep '^${CONDA_ENV}'; then \
	    ${CONDA} env update -f environment.yml; \
	else \
	    ${CONDA} env create -f environment.yml; \
	fi
.PHONY: create-env

ACTIVATE_ENV = source $(shell dirname $(dir $(CONDA)))/bin/activate $(CONDA_ENV)

install: clean create-env ## install dependencies
	$(ACTIVATE_ENV) && \
		gem update --system && \
		gem install addressable:'2.5.2' jekyll:'< 4' jekyll-feed jekyll-environment-variables jekyll-github-metadata jekyll-scholar:'< 6' jekyll-redirect-from jekyll-last-modified-at csl-styles awesome_bot html-proofer pkg-config kwalify
.PHONY: install

serve: ## run a local server (You can specify PORT=, HOST=, and FLAGS= to set the port, host or to pass additional flags)
	$(ACTIVATE_ENV) && \
		mv Gemfile Gemfile.backup || true && \
		mv Gemfile.lock Gemfile.lock.backup || true && \
		${JEKYLL} serve --strict_front_matter -d _site/erasmusmc-bioinformatics -P ${PORT} -H ${HOST} ${FLAGS}
.PHONY: serve

detached-serve: ## run a local server in detached mode (You can specify PORT=, HOST=, and FLAGS= to set the port, host or to pass additional flags to Jekyll)
	$(ACTIVATE_ENV) && \
		mv Gemfile Gemfile.backup || true && \
		mv Gemfile.lock Gemfile.lock.backup || true && \
		${JEKYLL} serve --strict_front_matter --detach -d _site/erasmusmc_bioinformatics -P ${PORT} -H ${HOST} ${FLAGS}
.PHONY: detached-serve

build: clean ## build files but do not run a server (You can specify FLAGS= to pass additional flags to Jekyll)
	$(ACTIVATE_ENV) && \
		mv Gemfile Gemfile.backup || true && \
		mv Gemfile.lock Gemfile.lock.backup || true && \
		${JEKYLL} build --strict_front_matter -d _site/erasmusmc_bioinformatics ${FLAGS}
.PHONY: build

check-frontmatter: ## Validate the frontmatter
	$(ACTIVATE_ENV) && \
		find topics/ -name tutorial.md -or -name slides.html -or -name metadata.yaml | \
	    xargs -n1 ruby bin/validate-frontmatter.rb
.PHONY: check-frontmatter

check-html: build ## validate HTML
	$(ACTIVATE_ENV) && \
	  	htmlproofer \
	      	--assume-extension \
	      	--http-status-ignore 405,503,999 \
	      	--url-ignore "/.*localhost.*/","/.*vimeo\.com.*/","/.*gitter\.im.*/","/.*drmaa\.org.*/" \
	      	--url-swap "github.com/ErasmusMC-Bioinformatics/erasmusmc-bioinformatics.github.io/tree/master:github.com/${REPO}/tree/${BRANCH}" \
	      	--file-ignore "/.*\/files\/.*/","/.*\/node_modules\/.*/" \
	      	--allow-hash-href \
	      	./_site
.PHONY: check-html

check-html-internal: build ## validate HTML (internal links only)
	$(ACTIVATE_ENV) && \
		htmlproofer \
	      	--assume-extension \
	      	--http-status-ignore 405,503,999 \
	      	--url-ignore "/.*localhost.*/","/.*vimeo\.com.*/","/.*gitter\.im.*/","/.*drmaa\.org.*/" \
	      	--url-swap "github.com/ErasmusMC-Bioinformatics/erasmusmc-bioinformatics.github.io/tree/master:github.com/${REPO}/tree/${BRANCH}" \
	      	--file-ignore "/.*\/files\/.*/","/.*\/node_modules\/.*/" \
	      	--disable-external \
	      	--allow-hash-href \
	      	./_site
.PHONY: check-html-internal

check-yaml: ## lint yaml files
	$(ACTIVATE_ENV) && \
		find . -name "*.yaml" | xargs -L 1 -I '{}' sh -c "yamllint {}" \
		find topics -name '*.yml' | xargs -L 1 -I '{}' sh -c "yamllint {}"
.PHONY: check-yaml

check-snippets: ## lint snippets
	./bin/check-for-trailing-newline
.PHONY: check-snippets

check-framework:
	$(ACTIVATE_ENV) && \
		ruby _plugins/jekyll-notranslate.rb
.PHONY: check-framework

check: check-yaml check-frontmatter check-html-internal check-html check-snippets ## run all checks
.PHONY: check

lint: ## run all linting checks
	$(MAKE) check-yaml
	$(MAKE) check-frontmatter
	$(MAKE) check-snippets
.PHONY: lint

check-links-gh-pages:  ## validate HTML on gh-pages branch (for daily cron job)
	$(ACTIVATE_ENV) && \
	  	htmlproofer \
			--assume-extension \
			--http-status-ignore 405,503,999 \
			--url-ignore "/.*localhost.*/","/.*vimeo\.com.*/","/.*gitter\.im.*/","/.*drmaa\.org.*/" \
			--file-ignore "/.*\/files\/.*/" \
			--allow-hash-href \
			. && \
		find . -path "**/slides*.html" \
			| xargs -L 1 -I '{}' sh -c "awesome_bot \
				--allow 405 \
				--allow-redirect \
				--white-list localhost,127.0.0.1,fqdn,vimeo.com,drmaa.com \
				--allow-ssl \
				--allow-dupe \
				--skip-save-results \
				-f {}"
.PHONY: check-links-gh-pages

clean: ## clean up junk files
	@rm -rf _site
	@rm -rf .sass-cache
	@rm -rf .bundle
	@rm -rf vendor
	@rm -rf node_modules
	@find . -name .DS_Store -exec rm {} \;
	@find . -name '*~' -exec rm {} \;
.PHONY: clean

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help
