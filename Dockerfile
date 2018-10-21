#    BISMON 
#    Copyright © 2018 Basile Starynkevitch (working at CEA, LIST, France)
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

FROM ubuntu:latest
MAINTAINER Niklas Rosencrantz (niklasro@gmail.com)
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install --yes software-properties-common
RUN apt-add-repository --yes --update ppa:ubuntu-toolchain-r/test
RUN apt-get update
RUN apt-get install --yes gcc-snapshot
RUN apt-get install --yes build-essential make ninja-build gcc-8 g++-8 gcc-8-plugin-dev libgccjit-8-dev libgtk-3-dev cmake
RUN apt-get install --yes markdown indent astyle tardy texlive texlive-full hevea git
RUN git clone https://github.com/ianlancetaylor/libbacktrace.git
RUN cd libbacktrace
RUN ./configure 
RUN make
RUN make install
RUN cd
RUN git clone https://github.com/davidmoreno/onion.git
RUN cd onion
RUN mkdir build
RUN cd build
RUN cmake ..
RUN make
RUN make install





