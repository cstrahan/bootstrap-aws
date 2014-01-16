#!/bin/bash -x

# For Ubuntu 12.04


# Images:
# Ubuntu Server 12.04.3 LTS - ami-de0d9eb7 (64-bit)
# Ubuntu Server 13.10       - ami-4b143122 (64-bit)


# http://www.debuntu.org/how-to-managing-services-with-update-rc-d/

# Lots of good info on packages:
#http://blog.eriksen.com.br/en/how-install-rabbitmq-latest-erlang-release-debian



mkdir /tmp/src

export DEBIAN_FRONTEND=noninteractive

# System attributes
sudo apt-get -q -y update
sudo apt-get install -q -y dpkg-dev
ARCHITECTURE=$(dpkg-architecture -qDEB_BUILD_ARCH) # e.g. amd64
UBUNTU_VERSION=$(lsb_release -rs)                  # e.g. 12.04
UBUNTU_CODENAME=$(lsb_release -sc)                 # e.g. precise

# Whole buncha packages I'll probably want...
sudo apt-get install -q -y   \
  libboost-all-dev           \
  libsnappy-dev              \
  libleveldb-dev             \
  ssl-cert                   \
  libossp-uuid16             \
  libossp-uuid-dev           \
  uuid-dev                   \
  libpcap-dev                \
  libmpfr-dev                \
  libmpc-dev                 \
  libmpfi-dev                \
  python-pip                 \
  libz-dev                   \
  libgmp-dev                 \
  gettext                    \
  libsasl2-dev               \
  libcurl3                   \
  libcurl3-gnutls            \
  libcurl4-openssl-dev       \
  libprotobuf7               \
  libprotobuf-dev            \
  libprotoc-dev              \
  libyajl-dev                \
  libevent-dev               \
  libpcre3                   \
  libunwind7-dev             \
  libcppunit-dev             \
  autotools-dev              \
  libltdl-dev                \
  m4                         \
  libtool                    \
  autopoint                  \
  valgrind                   \
  gdb                        \
  curl                       \
  cmake                      \
  python-dev                 \
  build-essential            \
  libreadline6               \
  libreadline6-dev           \
  zlib1g                     \
  zlib1g-dev                 \
  htop                       \
  libssl-dev                 \
  libyaml-dev                \
  libsqlite3-0               \
  libsqlite3-dev             \
  sqlite3                    \
  libsqlite3-dev             \
  libxml2-dev                \
  libxslt-dev                \
  autoconf                   \
  libc6-dev                  \
  libc6-dev-i386             \
  ncurses-dev                \
  automake                   \
  libtool                    \
  bison                      \
  subversion                 \
  openssl                    \
  fop                        \
  xsltproc                   \
  unixodbc-dev               \
  curl                       \
  mercurial                  \
  git-core                   \
  google-perftools           \
  libgoogle-perftools-dev    \
  mysql-client               \
  libmysqlclient-dev         \
  postgresql-client          \
  libpq-dev                  \
  libmagickcore-dev          \
  libmagickwand-dev          \
  exuberant-ctags            \
  cscope                     \
  lua5.2                     \
  python-software-properties \
  libmagick++-dev

# ZeroMQ (meh)
# http://download.zeromq.org/zeromq-3.2.4.tar.gz
# http://download.zeromq.org/zeromq-2.2.0.tar.gz
cd /tmp/src
wget http://download.zeromq.org/zeromq-4.0.2.tar.gz
tar -zxf zeromq-4.0.2.tar.gz
cd zeromq-4.0.2
./configure --prefix=/usr/local
make
sudo make install
sudo ldconfig

# Darner
#sudo apt-get install -q -y   \
#  libboost-all-dev           \
#  libsnappy-dev              \
#  libleveldb-dev
#cd /tmp/src
#git clone git://github.com/wavii/darner.git
#cd darner
#cmake . && make && sudo make install


# ZShell
sudo apt-get -q -y install zsh zsh-dev
#sudo chsh -s $(which zsh) root
#if [[ whoami != "root" ]]; then
#  sudo chsh -s $(which zsh) $(whoami)
#  # squelch the zsh-newuser-install prompt
#  [[ ! -f ~/.zshrc ]] && touch ~/.zshrc
#fi

# Clang / LLVM
#sudo apt-get -y install clang-3.3 llvm-3.2-dev
sudo add-apt-repository 'deb http://llvm.org/apt/precise/ llvm-toolchain-precise main'
wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key|sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y install \
  clang-3.4 \
  clang-3.4-doc \
  libclang-common-3.4-dev \
  libclang-3.4-dev \
  libclang1-3.4 \
  libclang1-3.4-dbg \
  libllvm-3.4-ocaml-dev \
  libllvm3.4 \
  libllvm3.4-dbg \
  lldb-3.4 \
  llvm-3.4 \
  llvm-3.4-dev \
  llvm-3.4-doc \
  llvm-3.4-examples \
  llvm-3.4-runtime \
  cpp11-migrate-3.4 \
  clang-format-3.4


# gcc 4.8 (default in 13.10)
sudo apt-get -q -y install autoconf automake libtool autotools-dev
sudo apt-get -q -y install python-software-properties
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get -q -y update
sudo apt-get -q -y install g++-4.8 libstdc++-4.8-dev
sudo update-alternatives --quiet --install /usr/bin/gcc  gcc  /usr/bin/gcc-4.8  60 \
                                 --slave   /usr/bin/g++  g++  /usr/bin/g++-4.8     \
                                 --slave   /usr/bin/gcov gcov /usr/bin/gcov-4.8
sudo update-alternatives --quiet --set gcc /usr/bin/gcc-4.8

# nginx
#sudo add-apt-repository -y ppa:nginx/stable
#sudo apt-get -q -y update 
#sudo apt-get -q -y install nginx


# JVM
sudo apt-get -q -y install python-software-properties
sudo add-apt-repository -y ppa:webupd8team/java 
sudo apt-get -q -y update 
sudo apt-get -q -y install binfmt-support
 
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true   | sudo debconf-set-selections
 
sudo apt-get -y install oracle-java7-installer 

sudo update-binfmts --package openjdk-7 --remove jar /usr/bin/jexec
sudo update-binfmts --package oracle-java7 --install jar /usr/bin/jexec --magic PK\x03\x04
 
sudo sh -c 'echo "\nJAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/environment'
export JAVA_HOME=/usr/lib/jvm/java-7-oracle


# Apache Apollo
#http://www.apache.org/dyn/closer.cgi?path=activemq/activemq-apollo/1.6/apache-apollo-1.6-unix-distro.tar.gz


# ruby-build
cd /tmp/src/src
git clone https://github.com/sstephenson/ruby-build.git
cd ruby-build
sudo ./install.sh


# chruby
cd /tmp/src
wget -O chruby-0.3.7.tar.gz https://github.com/postmodern/chruby/archive/v0.3.7.tar.gz
tar -xzvf chruby-0.3.7.tar.gz
cd chruby-0.3.7
sudo make install
source /usr/local/share/chruby/chruby.sh


# Erlang
downcase () { echo "$1" | tr '[:upper:]' '[:lower:]'; }
sudo apt-get -q -y install build-essential libncurses5-dev openssl libssl-dev
sudo mkdir -p /opt/erlang/
curl -O https://raw.github.com/spawngrid/kerl/master/kerl && chmod a+x kerl
sudo mv kerl /opt/erlang/
sudo ln -s /opt/erlang/kerl /usr/local/bin/kerl
kerl update releases
ERLANG_VERSIONS=( R15B02 R16B02 )
sudo bash -c "echo KERL_INSTALL_MANPAGES=yes > ~/.kerlrc" # work around kerl bug
for VERSION in "${ERLANG_VERSIONS[@]}"; do
  KERL_INSTALL_MANPAGES="yes" \
  KERL_CONFIGURE_OPTIONS="--enable-m64-build" \
    kerl build $VERSION $VERSION
  sudo kerl install $VERSION /opt/erlang/$(downcase VERSION)
done
sudo rm ~/.kerlrc
sudo rm -rf ~/.kerl
sudo ln -s /opt/erlang/r16b02 /opt/erlang/current
cd /usr/local/bin
sudo find /opt/erlang/current/bin -exec ln -s '{}' \;

# Riak
. /opt/erlang/r15b02/activate
cd /tmp/src
curl -O http://s3.amazonaws.com/downloads.basho.com/riak/1.4/1.4.2/riak-1.4.2.tar.gz
tar zxvf riak-1.4.2.tar.gz
cd riak-1.4.2
CC=gcc CXX=g++ CFLAGS="-m64" make
CC=gcc CXX=g++ CFLAGS="-m64" make rel
sudo mv rel /opt/riak-1.4.2
# No package for saucy/13.10 yet...
# curl http://apt.basho.com/gpg/basho.apt.key | sudo apt-key add -
# sudo bash -c "echo deb http://apt.basho.com $(lsb_release -sc) main > /etc/apt/sources.list.d/basho.list"
# sudo apt-get update
# sudo apt-get install riak


# RabbitMQ
sudo sh -c "echo deb http://www.rabbitmq.com/debian/ testing main > /etc/apt/sources.list.d/rabbitmq.list"
wget -O - http://www.rabbitmq.com/rabbitmq-signing-key-public.asc | sudo apt-key add -
sudo apt-get -q -y update
sudo apt-get -q -y install rabbitmq-server


# elixer
. /opt/erlang/r16b02/activate
cd /tmp/src
wget -O elixer-lang.tar.gz https://github.com/elixir-lang/elixir/archive/v0.10.3.tar.gz
tar -xzvf elixer-lang.tar.gz && rm elixer-lang.tar.gz
cd elixir-0.10.3
make
sudo make install


# GNU Smalltalk
sudo apt-get -q -y install gnu-smalltalk-common
sudo apt-get -q -y install gnu-smalltalk


# Racket
sudo add-apt-repository -y ppa:plt/racket
sudo apt-get update
sudo apt-get -q -y install racket


# clisp
sudo apt-get -q -y install clisp


# haskell
sudo apt-get -q -y install haskell-platform


# sbcl
sudo apt-get -q -y install sbcl


# MIT Scheme
# sudo apt-get install -q -y m4 autotools-dev libssl-dev libncurses5-dev libx11-dev libxt-dev libltdl-dev
# sudo apt-get install -q -y libmhash-dev libmcrypt-dev libgdbm-dev libpq-dev libdb-dev
# wget -O mit-scheme.tar.gz http://ftp.gnu.org/gnu/mit-scheme/stable.pkg/9.1.1/mit-scheme-9.1.1.tar.gz
# # wget -O mit-scheme.tar.gz http://ftp.gnu.org/gnu/mit-scheme/snapshot.pkg/20090107/mit-scheme-c-20090107.tar.gz
# tar xzf mit-scheme.tar.gz
# cd mit-scheme/src
# etc/make-liarc.sh
# sudo make install
# cd /tmp/src
# rm -rf mit-scheme


# OCaml
sudo apt-get install -y ocaml


# SML
sudo apt-get install -y smlnj


# Jetty
#wget 'http://eclipse.org/downloads/download.php?file=/jetty/stable-9/dist/jetty-distribution-9.1.0.v20131115.tar.gz&r=1' -O jetty.tar.gz
#tar -zxf jetty.tar.gz
#sudo mv jetty-distribution-9.1.0.v20131115 /opt/jetty
#sudo cp /opt/jetty/bin/jetty.sh /etc/init.d/jetty
#cat > /etc/default/jetty <<-EOF
#JAVA=/usr/bin/java    # Path to Java
#NO_START=0            # Start on boot
#JETTY_HOST=0.0.0.0    # Listen to all hosts
#JETTY_ARGS=jetty.port=8085
#JETTY_USER=jetty      # Run as this user
#EOF
#service jetty start
#update-rc.d jetty defaults


# Rubies
sudo mkdir -p /opt/rubies
CONFIGURE_OPTS="--enable-shared" sudo ruby-build -v 1.8.7-p374 /opt/rubies/ruby-1.8.7-p374
CONFIGURE_OPTS="--enable-shared" sudo ruby-build -v 1.9.3-p448 /opt/rubies/ruby-1.9.3-p448
CONFIGURE_OPTS="--enable-shared" sudo ruby-build -v 2.0.0-p247 /opt/rubies/ruby-2.0.0-p247
sudo ruby-build -v jruby-1.7.6 /opt/rubies/jruby-1.7.6
sudo ruby-build -v rbx-2.1.1   /opt/rubies/rbx-2.1.1
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
sudo sh -c 'echo "gem: --no-ri --no-rdoc" > /root/.gemrc'


# VIM
# (Note: may be better to not remove existing vim, and install into
#  /usr/local/bin - some packages [in]directly depend on vim-tiny and such...)
# Could also consider modifying /var/lib/dpkg/status, but that sounds dirty...

# Not doing this - going to keep side-by-side installations
# sudo apt-get -y remove vim vim-runtime gvim vim-tiny vim-common
#sudo echo vim-tiny hold | dpkg --set-selections

sudo apt-get -y install \
  cscope          \
  libperl-dev     \
  python-dev      \
  lua5.2          \
  liblua5.2-dev   \
  luajit          \
  libluajit-5.1-2 \
  libluajit-5.1-dev
# checkinstall

# Because 12.04 sucks...
if [[ $UBUNTU_VERSION < "12.10" ]]; then
  [[ ! -f /usr/bin/luajit ]] && sudo ln -s /usr/bin/luajit-2.0.0-beta9 /usr/bin/luajit
fi

cd /tmp/src
chruby ruby-1.9.3 # use custom /opt/rubies/ruby-1.9.3 for rubyinterp
hg clone https://code.google.com/p/vim/
cd vim

if [[ -d /usr/lib/python2.7/config-x86_64-linux-gnu ]]; then
  python_config_dir="--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu"
elif [[ -d /usr/lib/python2.7/config ]]; then
  python_config_dir="--with-python-config-dir=/usr/lib/python2.7/config"
fi
# 12.04
./configure --enable-fail-if-missing \
            --with-features=huge     \
            $python_config_dir       \
            --enable-rubyinterp      \
            --enable-pythoninterp    \
            --enable-perlinterp      \
            --enable-luainterp       \
            --with-luajit            \
            --enable-cscope          \
            --prefix=/usr/local
            # --enable-mzschemeinterp  \  # I don't really trust this to be stable . . .
make VIMRUNTIMEDIR=/usr/local/share/vim/vim74
sudo make install
# sudo checkinstall --default # probably not necessary, since we're avoiding the original package paths.
cd /tmp/src
sudo rm -rf vim
# sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
# sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim


# LaTeX (~1.5 gigs)
#sudo apt-get install --install-recommends texlive-full


# Docker
sudo apt-get -y install curl wget git
sudo sh -c "wget -qO- https://get.docker.io/gpg | apt-key add -"
sudo sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
sudo apt-get update
sudo apt-get -y install lxc-docker
sudo apt-get -y install linux-image-extra-`uname -r`
sudo apt-get -y install build-essential linux-headers-generic
sudo modprobe aufs




# HAProxy (1.5dev - include SSL support)
# http://haproxy.1wt.eu/download/1.5/src/devel/haproxy-1.5-dev19.tar.gz
cd /tmp/src
git clone http://git.1wt.eu/git/haproxy.git
cd haproxy
sudo apt-get -q -y install build-essential libssl-dev libpopt-dev git libpcre3-dev
make TARGET=linux2628 CPU=native USE_PCRE=1 USE_OPENSSL=1 USE_ZLIB=1
sudo make install




# Thrift Deps
sudo apt-get install -y         \
  libboost-dev                  \
  libboost-test-dev             \
  libboost-program-options-dev  \
  libevent-dev                  \
  automake                      \
  libtool                       \
  flex                          \
  bison                         \
  pkg-config                    \
  g++                           \
  libssl-dev


# AWS util
#cd /tmp/src
#wget http://s3.amazonaws.com/ec2metadata/ec2-metadata
#chmod u+x ec2-metadata
#sudo mv ec2-metadata /usr/local/bin


# NodeJS
cd /tmp/src
sudo apt-get -q -y install python g++ make
wget http://nodejs.org/dist/v0.10.22/node-v0.10.22.tar.gz
tar -zxf node-v0.10.22.tar.gz
cd node-v0.10.22
./configure --prefix=/usr/local/ && make && sudo make install
# ./configure --prefix=/usr/local/ && make && sudo checkinstall --install=yes --pkgname=nodejs --pkgversion "0.10.22" --default
# echo "nodejs hold" | sudo dpkg --set-selections


# nasm
sudo apt-get install -y nasm


# Mosh
#sudo add-apt-repository -y ppa:keithw/mosh
#sudo apt-get -y update
#sudo apt-get -y install mosh


# IO - I get a linker error...
# sudo apt-get -y install libssl-dev cmake libevent-dev libyajl-dev libgmp-dev
# cd /tmp/src
# git clone https://github.com/stevedekorte/io.git
# cd io
# mkdir build && cd build
# cmake ..
# make
# sudo make install


# ZFS
# (it recommends ubuntu-minimal, which depends on vim-tiny,
#  which is annoying because I build vim from source)
sudo add-apt-repository -y ppa:zfs-native/stable
sudo apt-get -y update
sudo apt-get -y install build-essential linux-headers-generic
sudo apt-get -y install ubuntu-zfs


# AG
cd /tmp/src
sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
wget https://github.com/ggreer/the_silver_searcher/archive/0.18.tar.gz
tar -zxf 0.18.tar.gz
cd the_silver_searcher-0.18
./build.sh
sudo make install


# Redis
cd /tmp/src
wget http://download.redis.io/releases/redis-2.8.0.tar.gz
tar -zxf redis-2.8.0.tar.gz
cd redis-2.8.0
make
sudo make install


# SWI prolog
sudo apt-get -y install swi-prolog-nox
# (not quite complete)
# sudo apt-get install \
#         build-essential autoconf curl chrpath \
#         ncurses-dev libreadline-dev libunwind8-dev \
#         libgmp-dev \
#         libxext-dev libice-dev libjpeg-dev libxinerama-dev libxft-dev \
#         libxpm-dev libxt-dev pkg-config \
#         libssl-dev \
#         unixodbc-dev \
# #        openjdk-7-jdk junit \
#         zlib1g-dev libarchive-dev \
#         libossp-uuid-dev
# wget http://www.swi-prolog.org/download/stable/src/pl-6.4.1.tar.gz
# tar zxvf pl-6.4.1.tar.gz
# cd pl-6.4.1
# cp -p build.templ build
# ./build


# Mesos
# 3rdparty/leveldb will try to detect libsnappy, and then include the
# corresponding headers, expecting to be linked with the lib; this will fail,
# as mesos does not link to snappy.
# See: http://mail-archives.apache.org/mod_mbox/incubator-mesos-dev/201306.mbox/%3C51BB7FEC.4080103@gmail.com%3E
sudo apt-get install -y git-core build-essential python-dev autoconf libtool
sudo apt-get install -y autoconf autotools-dev libltdl-dev libtool autoconf autopoint libsasl2-dev
sudo apt-get install -y libcurl3 libcurl3-gnutls libcurl4-openssl-dev
sudo apt-get install -y libsnappy-dev
cd /tmp/src
git clone --depth 1 git://git.apache.org/mesos.git
# 0.14.2
# 1.15.0-rc2
cd mesos
./bootstrap
# --with-python-headers=DIR     Find Python header files in DIR (to turn on Python support). Recommended.
# --with-webui                  Enable the Mesos web UI (which requires Python 2.6). Recommended.
# --with-java-home=DIR          Enable Java application/framework support with a given installation of Java. Required for Hadoop and Spark.
# --with-java-headers=DIR       Find Java header files (necessary for newer versions of OS X Snow Leopard).
# --with-zookeeper=DIR or       Enable master fault-tolerance using an existing ZooKeeper installation or
#   --with-included-zookeeper     the version of ZooKeeper bundled with Mesos.
./configure \
  --with-python-headers=/usr/include/python2.7 \
  --with-webui \
  --with-java-home=$JAVA_HOME \
  --with-included-zookeeper LIBS=' -lsnappy'
make
sudo make install


# CLEAN UP TIME
sudo apt-get -q -y autoclean
sudo apt-get -q -y clean
sudo apt-get -q -y autoremove
sudo rm -rf /tmp/*
sudo rm -rf /var/lib/apt/lists/*
sudo rm -rf /var/cache/*


# just in case
cd ~
sudo ldconfig

exit 0
###########################
# <snip>
###########################

# SolrCloud
#   http://systemsarchitect.net/painless-guide-to-solr-cloud-configuration/
#   http://www.youtube.com/watch?v=eVK0wLkLw9w
#   http://wiki.apache.org/solr/SolrCloud

# ElasticSearch (https://gist.github.com/wingdspur/2026107)
#wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.7.deb
#sudo dpkg -i elasticsearch-0.90.7.deb
#rm elasticsearch-0.90.7.deb
#sudo service elasticsearch start

# CDH Hadoop (et al)


# Julia (from .travis.yml file)
#cd /tmp/src
#git clone https://github.com/JuliaLang/julia.git
#cd julia
#BUILDOPTS="LLVM_CONFIG=llvm-config-3.3 VERBOSE=1 USE_BLAS64=0"; for lib in LLVM ZLIB SUITESPARSE ARPACK BLAS FFTW LAPACK GMP MPFR PCRE LIBUNWIND READLINE GRISU OPENLIBM RMATH; do export BUILDOPTS="$BUILDOPTS USE_SYSTEM_$lib=1"; done
#sudo apt-get update -qq -y
#sudo apt-get install zlib1g-dev
#sudo add-apt-repository ppa:staticfloat/julia-deps -y
#sudo apt-get update -qq -y
#sudo apt-get install patchelf gfortran llvm-3.3-dev libsuitesparse-dev libncurses5-dev libopenblas-dev liblapack-dev libarpack2-dev libfftw3-dev libgmp-dev libpcre3-dev libunwind7-dev libreadline-dev libdouble-conversion-dev libopenlibm-dev librmath-dev libmpfr-dev -y
#make $BUILDOPTS PREFIX=/usr/local install


# CDH 4
# http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH4/latest/CDH4-Installation-Guide/cdh4ig_topic_4.html
# http://zookeeper.apache.org/doc/r3.3.2/zookeeperAdmin.html
# http://zookeeper.apache.org/doc/r3.1.2/zookeeperProgrammers.html
sudo bash -c "echo deb [arch=amd64] http://archive.cloudera.com/cdh4/ubuntu/$(lsb_release -sc)/amd64/cdh $(lsb_release -sc)-cdh4 contrib >> /etc/apt/sources.list.d/cloudera.list"
sudo bash -c "echo deb-src http://archive.cloudera.com/cdh4/ubuntu/$(lsb_release -sc)/amd64/cdh $(lsb_release -sc)-cdh4 contrib >> /etc/apt/sources.list.d/cloudera.list"
curl -s http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh/archive.key | sudo apt-key add -
sudo apt-get -y update
sudo apt-get install zookeeper
sudo apt-get install zookeeper-server
#sudo service zookeeper-server init --myid=1
#sudo service zookeeper-server start
#/var/lib/zookeeper
