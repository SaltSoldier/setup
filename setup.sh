#アップデートアップグレード
sudo yum update
sudo yum upgrade

#ユーザー追加、ユーザーパスワー追加
#sudo useradd ryoheishioji
#sudo passwd ryoheishioji

#ユーザーにsudo権限を追加
#sudo usermod -G wheel ryoheishioji

#sudoユーザーの切り替え
#su -l ryoheishioji

#Gitインストール
sudo yum -y install gcc curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker
wget https://www.kernel.org/pub/software/scm/git/git-2.8.4.ter.gz
tar xzvf git-2.8.4.tar.gz
cd git-2.8.4
sudo make prefix=/usr/local all
sudo make prefix=/usr/local install
git --version

#tmuxインストール
sudo yum -y install tmux

#Node.jsインストール
curl -L git.io/nodebrew | perl - setup
echo 'export PATH="$HOME/.nodebrew/current/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
nodebrew install-binary latest
nodebrew use latest
node -v

#rbenvセットアップ
sudo yum -y install　gcc-c++ glibc-headers readline libyaml-devel readline-devel zlib sqlite-devel
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
rbenv -v

#Ruby&Railsインストール
rbenv install 2.3.1
rbenv global 2.3.1
rbenv local 2.3.1
rbenv rehash
ruby -v
gem install rails --no-document
rails -v

#firewallの設定
sudo firewall-cmd --permanent --add-port=3000/tcp
sudo firewall-cmd --reload
