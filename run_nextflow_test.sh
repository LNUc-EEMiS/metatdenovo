#!/bin/sh

nextflow main.nf -with-singularity metatdenovo.simg -config conf/test.config $* #--max_time=72h
