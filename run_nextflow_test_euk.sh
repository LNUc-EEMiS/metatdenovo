#!/bin/sh

nextflow main.nf -with-singularity metatdenovo.simg -config conf/test_euk.config #--max_time=72h
