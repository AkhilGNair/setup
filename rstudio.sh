#/bin/bash

# Build rstudio from source (requires git)
cd /tmp/

git clone https://github.com/rstudio/rstudio.git

sudo DEBIAN_FRONTEND=noninteractive apt update && \
  sudo DEBIAN_FRONTEND=noninteractive apt-get --yes --force-yes install \
      libboost-all-dev \
    cmake \
    libqt4-dev \
    build-essential \
    libqtwebkit-dev

cd /tmp/rstudio/dependencies/common
bash install-common
bash install-qt-sdk

cd /tmp/rstudio/dependencies/linux
bash install-dependencies-debian

cd /tmp/rstudio &&  \
  mkdir build && \
  cd build && \
  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release && \
  sudo make 

sudo make install

sudo ln -s /usr/local/lib/rstudio/bin/rstudio /usr/bin

cd