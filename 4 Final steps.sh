sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

yay -S obfs4proxy jcal-git virtualbox-ext-oracle
# gns3-gui gns3-server dynamips

sudo vim /etc/httpd/conf/extra/httpd-userdir.conf
	Options Indexes FollowSymLinks
	AllowOverride All
