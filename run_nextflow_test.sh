#!/bin/sh

nextflow run main.nf -config docker,test $* #--max_time=72h
