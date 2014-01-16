#!/bin/bash -x

# For Ubuntu 13.10

export DEBIAN_FRONTEND=noninteractive

sudo apt-get -q -y update
sudo apt-get -q -y dist-upgrade

sudo apt-get install -q -y   \
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
  libunwind8-dev             \
  libcppunit-dev             \
  autotools-dev              \
  libltdl-dev                \
  libtool                    \
  autopoint                  \
  valgrind                   \
  gdb                        \
  curl                       \
  zsh                        \
  zsh-dev                    \
  cmake                      \
  clang-3.3                  \
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


# gcc 4.8 (default in 13.10 - keeping around for previous versions)
# sudo apt-get install autoconf automake libtool autotools-dev
# sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
# sudo apt-get -q -y update
# sudo update-alternatives --quiet --install /usr/bin/gcc  gcc  /usr/bin/gcc-4.8  60 \
                                 # --slave   /usr/bin/g++  g++  /usr/bin/g++-4.8     \
                                 # --slave   /usr/bin/gcov gcov /usr/bin/gcov-4.8
# sudo update-alternatives --quiet --set gcc /usr/bin/gcc-4.8

# nginx
#sudo add-apt-repository -y ppa:nginx/stable
#sudo apt-get -q -y update 
#sudo apt-get -q -y install nginx


# JVM
sudo add-apt-repository -y ppa:webupd8team/java 
sudo apt-get -q -y update 
sudo apt-get -y install binfmt-support
 
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true   | sudo debconf-set-selections
 
sudo apt-get -y install oracle-java7-installer 

sudo update-binfmts --package openjdk-7 --remove jar /usr/bin/jexec
sudo update-binfmts --package oracle-java7 --install jar /usr/bin/jexec --magic PK\x03\x04
 
sudo sh -c 'echo "\n\nJAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/environment'
export JAVA_HOME=/usr/lib/jvm/java-7-oracle/ 


# ruby-build
cd ~
git clone https://github.com/sstephenson/ruby-build.git
cd ruby-build
sudo ./install.sh
cd ~
rm -rf ruby-build


# chruby
cd ~
wget -O chruby-0.3.7.tar.gz https://github.com/postmodern/chruby/archive/v0.3.7.tar.gz
tar -xzvf chruby-0.3.7.tar.gz
cd chruby-0.3.7
sudo make install
cd ~
rm -rf chruby-0.3.7
source /usr/local/share/chruby/chruby.sh


# Erlang
# http://docs.basho.com/riak/latest/ops/building/installing/erlang/#Installing-on-GNU-Linux
cd ~
# wget -O otp_src.tar.gz http://erlang.org/download/otp_src_R15B01.tar.gz # for Riak 1.4.2
wget -O otp_src.tar.gz http://erlang.org/download/otp_src_R16B02.tar.gz
tar zxvf otp_src.tar.gz && rm otp_src.tar.gz
cd otp_src*
./configure && make && sudo make install
cd ~
rm -rf otp_src*


# elixer
cd ~
wget -O elixer-lang.tar.gz https://github.com/elixir-lang/elixir/archive/v0.10.3.tar.gz
tar -xzvf elixer-lang.tar.gz && rm elixer-lang.tar.gz
cd elixir-0.10.3
make
sudo make install
cd ~
rm -rf elixir-0.10.3


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
# cd ~
# rm -rf mit-scheme


# OCaml
sudo apt-get install -y ocaml


# SML
sudo apt-get install -y smlnj


# Riak
# (it's no use...)
# cd ~
# curl -O http://s3.amazonaws.com/downloads.basho.com/riak/1.4/1.4.2/riak-1.4.2.tar.gz
# tar zxvf riak-1.4.2.tar.gz
# cd riak-1.4.2
# sed -i -e 's/R15/R15|R16B02/' rebar.config # hack in support for my R16B02
# make rel
# mv rel riak
# sudo mv riak /opt
# No package for saucy/13.10 yet...
# curl http://apt.basho.com/gpg/basho.apt.key | sudo apt-key add -
# sudo bash -c "echo deb http://apt.basho.com $(lsb_release -sc) main > /etc/apt/sources.list.d/basho.list"
# sudo apt-get update
# sudo apt-get install riak


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
  checkinstall  \
  libperl-dev   \
  python-dev    \
  lua5.2        \
  liblua5.2-dev \
  luajit        \
  libluajit-5.1-dev

cd ~
chruby ruby-1.9.3 # use custom /opt/rubies/ruby-1.9.3 for rubyinterp
hg clone https://code.google.com/p/vim/
cd vim

if [[ -d /usr/lib/python2.7/config-x86_64-linux-gnu ]]; then
  python_config_dir="--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu"
elif [[ -d /usr/lib/python2.7/config ]]; then
  python_config_dir="--with-python-config-dir=/usr/lib/python2.7/config"
fi
./configure --enable-fail-if-missing \
            --with-features=huge     \
            $python_config_dir       \
            --enable-rubyinterp      \
            --enable-pythoninterp    \
            --enable-perlinterp      \
            --enable-luainterp       \
            --with-luajit            \
            --enable-cscope          \
            --prefix=/usr
            # --enable-mzschemeinterp  \  # don't really trust this to be stable . . .
make VIMRUNTIMEDIR=/usr/local/share/vim/vim74
sudo checkinstall  --default
cd ~
sudo rm -rf vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
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
sudo modprobe aufs


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
cd ~
wget http://s3.amazonaws.com/ec2metadata/ec2-metadata
chmod u+x ec2-metadata
sudo mv ec2-metadata /usr/bin


# NodeJS
cd ~
sudo apt-get install python g++ make checkinstall
wget http://nodejs.org/dist/v0.10.21/node-v0.10.21.tar.gz
tar -zxf node-v0.10.21.tar.gz
cd node-v0.10.21
./configure && make && sudo checkinstall --install=yes --pkgname=nodejs --pkgversion "0.10.21" --default


# nasm
sudo apt-get install -y nasm


# Mosh
sudo add-apt-repository -y ppa:keithw/mosh
sudo apt-get -y update
sudo apt-get -y install mosh


# IO - I get a linker error...
# sudo apt-get -y install libssl-dev cmake libevent-dev libyajl-dev libgmp-dev
# cd ~
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
sudo apt-get -y install --without-recommends \
  build-essential \
  zfs-mountall    \
  ubuntu-zfs


# AG
cd ~
sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
wget https://github.com/ggreer/the_silver_searcher/archive/0.18.tar.gz
tar -zxf 0.18.tar.gz
cd the_silver_searcher-0.18
./build.sh
sudo make install

# http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH4/latest/CDH4-Installation-Guide/cdh4ig_topic_4.html
#sudo bash -c "echo deb [arch=amd64] http://archive.cloudera.com/cdh4/ubuntu/$(lsb_release -sc)/amd64/cdh $(lsb_release -sc)-cdh4 contrib >> /etc/apt/sources.list.d/cloudera.list"
#sudo bash -c "echo deb-src http://archive.cloudera.com/cdh4/ubuntu/$(lsb_release -sc)/amd64/cdh $(lsb_release -sc)-cdh4 contrib >> /etc/apt/sources.list.d/cloudera.list"
#curl -s http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh/archive.key | sudo apt-key add -
#sudo apt-get -y update

# Mesos
sudo apt-get install -y git-core build-essential
sudo apt-get install -y autoconf autotools-dev libltdl-dev libtool autoconf autopoint libsasl2-dev
sudo apt-get install -y libcurl3 libcurl3-gnutls libcurl4-openssl-dev # https://github.com/taf2/curb
# TODO: zookeeper
cd ~
git clone --depth 1 git://git.apache.org/mesos.git
# refs/tags/0.15.0-rc2
cd mesos
./bootstrap

# --with-python-headers=DIR     Find Python header files in DIR (to turn on Python support). Recommended.
# --with-webui                  Enable the Mesos web UI (which requires Python 2.6). Recommended.
# --with-java-home=DIR          Enable Java application/framework support with a given installation of Java. Required for Hadoop and Spark.
# --with-java-headers=DIR       Find Java header files (necessary for newer versions of OS X Snow Leopard).
# --with-zookeeper=DIR or       Enable master fault-tolerance using an existing ZooKeeper installation or
#   --with-included-zookeeper     the version of ZooKeeper bundled with Mesos. For details, see High Availability.
./configure \
  --with-python-headers=/usr/include/python2.7 \
  --with-webui \
  --with-java-home=$JAVA_HOME \
  --with-zookeeper=
make


# SWI prolog (not quite complete)
#   (or sudo apt-get -y install swi-prolog-nox ???)
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


#Package: ubuntu-minimal
#Status: install ok installed
#Priority: optional
#Section: metapackages
#Installed-Size: 59
#Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
#Architecture: amd64
#Source: ubuntu-meta
#Version: 1.307
#Depends: adduser, apt, apt-utils, bzip2, console-setup, debconf, debconf-i18n, eject, gnupg, ifupdown, initramfs-tools, iproute2, iputils-ping, isc-dhcp-client, kbd, less, locales, lsb-release, makedev, mawk, module-init-tools, net-tools, netbase, netcat-openbsd, ntpdate, passwd, procps, python3, resolvconf, rsyslog, sudo, tzdata, ubuntu-keyring, udev, upstart, ureadahead, whiptail
#Description: Minimal core of Ubuntu
# This package depends on all of the packages in the Ubuntu minimal system,
# that is a functional command-line system with the following capabilities:
# .
#  - Boot
#  - Detect hardware
#  - Connect to a network
#  - Install packages
#  - Perform basic diagnostics
# .
# It is also used to help ensure proper upgrades, so it is recommended that
# it not be removed.
