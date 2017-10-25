# Makefile for top level of lmbench
SHELL = /bin/sh
MAKE = make
OS = $(shell scripts/os)

.PHONY: build opt install doc clean info help

build:
	@mkdir -p bin/$(OS)
	@$(MAKE) -C src

opt:
	@$(MAKE) -C src opt

install:
	@$(MAKE) -C src install

doc:
	@$(MAKE) -C doc install

clean: 
	@for i in doc src; do ($(MAKE) -C $$i clean); done
	@/bin/rm -rf bin/*

info: 
	for i in doc src scripts; do \
		echo ===== $$i =====; \
		(cd $$i && info); \
	done

help:
	@echo 'lmbench		builds the benchmark suite for the current os/arch [default]'
	@echo 'clean		cleans out sources'
