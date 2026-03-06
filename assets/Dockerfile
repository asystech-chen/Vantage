FROM ubuntu:jammy
#FROM fedora:36

RUN ( apt-get update && apt-get -y upgrade && apt-get -y install make wget git patch unzip ; true )
RUN ( dnf -y update && dnf -y install make wget git patch unzip ; true )
# dependencies needed to run ./mach bootstrap
RUN ( apt-get -y update && apt-get -y upgrade && apt-get -y install python3 python3-dev python3-pip wget dpkg-sig ; true )
RUN ( dnf -y upgrade && dnf -y install python3 python3-devel wget rpm-build rpm-sign ; true )

# grab the latest source cleanly
WORKDIR /
RUN rm -rf /source
RUN git clone --recursive https://codeberg.org/librewolf/source.git
WORKDIR /source

RUN make check && make setup-debian && make fetch && make bootstrap && make build package && make veryclean
#RUN make check && make setup-fedora && make fetch && make bootstrap && make build package && make veryclean

