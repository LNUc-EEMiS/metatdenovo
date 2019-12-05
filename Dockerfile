FROM nfcore/base:1.7
LABEL authors="daniel.lundin@lnu.se" \
      description="Docker image containing all requirements for nf-core/metatdenovo pipeline"

COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a
ENV PATH /opt/conda/envs/nf-core-metatdenovo-1.0dev/bin:$PATH
