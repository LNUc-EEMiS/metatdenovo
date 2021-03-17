# ![nf-core/metatdenovo](docs/images/nf-core-metatdenovo_logo.png)

**Assembly and annotation of prokaryotic metatranscriptomes.**.

[![GitHub Actions CI Status](https://github.com/nf-core/metatdenovo/workflows/nf-core%20CI/badge.svg)](https://github.com/nf-core/metatdenovo/actions)
[![GitHub Actions Linting Status](https://github.com/nf-core/metatdenovo/workflows/nf-core%20linting/badge.svg)](https://github.com/nf-core/metatdenovo/actions)
[![Nextflow](https://img.shields.io/badge/nextflow-%E2%89%A520.04.0-brightgreen.svg)](https://www.nextflow.io/)

[![install with bioconda](https://img.shields.io/badge/install%20with-bioconda-brightgreen.svg)](https://bioconda.github.io/)
[![Docker](https://img.shields.io/docker/automated/nfcore/metatdenovo.svg)](https://hub.docker.com/r/nfcore/metatdenovo)
[![Get help on Slack](http://img.shields.io/badge/slack-nf--core%20%23metatdenovo-4A154B?logo=slack)](https://nfcore.slack.com/channels/metatdenovo)

## Introduction

**nf-core/metatdenovo** is a bioinformatics best-practise analysis pipeline for *de novo* assembly of primarily metatranscriptomes.
Besides assembling reads, it also calls ORFs and annotates them taxonomically and functionally.

The pipeline is built using [Nextflow](https://www.nextflow.io), a workflow tool to run tasks across multiple compute infrastructures in a very portable manner. It comes with docker containers making installation trivial and results highly reproducible.

## Quick Start

1. Install [`nextflow`](https://nf-co.re/usage/installation)

2. Install any of [`Docker`](https://docs.docker.com/engine/installation/), [`Singularity`](https://www.sylabs.io/guides/3.0/user-guide/) or [`Podman`](https://podman.io/) for full pipeline reproducibility _(please only use [`Conda`](https://conda.io/miniconda.html) as a last resort; see [docs](https://nf-co.re/usage/configuration#basic-configuration-profiles))_

3. Download the pipeline and test it on a minimal dataset with a single command:

    ```bash
    nextflow run nf-core/metatdenovo -profile test,<docker/singularity/podman/conda/institute>
    ```

    > Please check [nf-core/configs](https://github.com/nf-core/configs#documentation) to see if a custom config file to run nf-core pipelines already exists for your Institute. If so, you can simply use `-profile <institute>` in your command. This will enable either `docker` or `singularity` and set the appropriate execution settings for your local compute environment.

4. Start running your own analysis!

    ```bash
    nextflow run nf-core/metatdenovo -profile <docker/singularity/podman/conda/institute> --input '*_R{1,2}.fastq.gz' --emapper --megan_taxonomy --summary
    ```

See [usage docs](https://nf-co.re/metatdenovo/usage) for all of the available options when running the pipeline.

## Pipeline Summary

By default, the pipeline currently performs the following:

* Sequencing quality control (`FastQC`)
* Overall pipeline run summaries (`MultiQC`)
* Read trimming (`trim_galore`)
* Assembly (`Megahit`, `rnaSPADes` or `Trinity`)
* ORF calling/annotation (`Prokka` or `trinotate`/`transdecoder`)
* Quantification of ORFs (`BBMap` and `subread`)

## Documentation

The nf-core/metatdenovo pipeline comes with documentation about the pipeline: [usage](https://nf-co.re/metatdenovo/usage) and [output](https://nf-co.re/metatdenovo/output).

Starting from Illumina sequence reads, the pipeline performs assembly -- using `Megahit`, `rnaSPADes` or `Trinity` -- after trimming and, optionally, digital normalization of reads.
The assembly is followed by annotation by `Prokka` or ORF calling with `transdecoder` (the former (potentially) better suited for bacterial transcriptomes, the latter for eukaryotic).
ORFs can be annotated taxonomically by aligning them to the NCBI RefSeq database with `Diamond` and postprocessing with `Megan`.
This will produce an NCBI taxonomy as well as a GTDB taxonomy for Bacteria and Archaea.
The main functional annotation program in the pipeline is the `EggNOG mapper` (`--emapper`) but EggNOG and "Interpro2GO" annotations are also output as a side effect of the Diamond/Megan/RefSeq taxonomical annotation.

If you specify the `--summary` parameter, tab separated files, suitable for downstream analysis will be generated, by default in `results/summary`.

*Note:* Large databases are downloaded by default by the `--megan_taxonomy` and `--emapper` options.
The processed versions of these are saved in the output directory structure (by default `results/refseq/refseq_protein.dmnd`, `results/ncbi_taxonomy/ncbi_taxonomy.tsv.gz` and `results/eggnogdb` respectively) and can be used in the later runs of the pipeline by specifying the `--refseq_dmnd`, `--ncbitaxonomy` and `--eggnogdb` parameters with appropriate arguments (e.g. the paths given in this sentence).

## Credits

nf-core/metatdenovo was originally written by daniel.lundin@lnu.se and emelie.nilsson@lnu.se.

We thank the following people for their extensive assistance in the development
of this pipeline:

## Contributions and Support

If you would like to contribute to this pipeline, please see the [contributing guidelines](.github/CONTRIBUTING.md).

For further information or help, don't hesitate to get in touch on the [Slack `#metatdenovo` channel](https://nfcore.slack.com/channels/metatdenovo) (you can join with [this invite](https://nf-co.re/join/slack)).

## Citations

<!-- TODO nf-core: Add citation for pipeline after first release. Uncomment lines below and update Zenodo doi. -->
<!-- If you use  nf-core/metatdenovo for your analysis, please cite it using the following doi: [10.5281/zenodo.XXXXXX](https://doi.org/10.5281/zenodo.XXXXXX) -->

You can cite the `nf-core` publication as follows:

> **The nf-core framework for community-curated bioinformatics pipelines.**
>
> Philip Ewels, Alexander Peltzer, Sven Fillinger, Harshil Patel, Johannes Alneberg, Andreas Wilm, Maxime Ulysse Garcia, Paolo Di Tommaso & Sven Nahnsen.
>
> _Nat Biotechnol._ 2020 Feb 13. doi: [10.1038/s41587-020-0439-x](https://dx.doi.org/10.1038/s41587-020-0439-x).
> ReadCube: [Full Access Link](https://rdcu.be/b1GjZ)

In addition, references of tools and data used in this pipeline are as follows:

<!-- TODO nf-core: Add bibliography of tools and data used in your pipeline -->
