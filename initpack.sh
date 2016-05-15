#sudo dd if=/dev/zero of=tmpswap bs=1M count=512
#sudo chmod 600 tmpswap
#sudo mkswap tmpswap
#sudo swapon tmpswap
#
#sudo yum install epel-release
#
packages=(vim screen)
packages+=(gcc-c++ gdb)
packages+=(python34 python34-devel python34-setuptools)
packages+=(nginx)
packages+=(libxml2 libxml2-devel libxslt libxslt-devel)
packages+=(git)
packages+=(weechat)

sudo yum install ${packages[@]}

sudo ln -s /usr/include/libxml2/libxml /usr/include/libxml

sudo easy_install-3.4 pip
pip_packages=()
pip_packages+=(uwsgi)
pip_packages+=(django)
pip_packages+=(flask flask-sqlalchemy)
pip_packages+=(lxml)
sudo pip3 install ${pip_packages[@]}
