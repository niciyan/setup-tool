set -e

sudo apt update
sudo apt install language-pack-ja
sudo localectl set-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"
sudo -s source /etc/default/locale