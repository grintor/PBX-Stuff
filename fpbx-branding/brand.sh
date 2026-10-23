#!/bin/bash
# curl http://github/grintor/PBX-Stuff/brand.sh | sudo bash

dbpass=$(php -r "require_once('/etc/freepbx.conf'); print_r(\$amp_conf['AMPDBPASS']);")
mysql -ufreepbxuser -p$dbpass -e "UPDATE freepbx_settings SET value = 'custom.css' WHERE keyword = 'BRAND_CSS_CUSTOM'" asterisk
mysql -ufreepbxuser -p$dbpass -e "UPDATE freepbx_settings SET value = 'http://www.tier2.tech' WHERE keyword = 'BRAND_IMAGE_FREEPBX_LINK_LEFT'" asterisk
mysql -ufreepbxuser -p$dbpass -e "UPDATE freepbx_settings SET value = 'http://www.tier2.tech' WHERE keyword = 'BRAND_IMAGE_FREEPBX_LINK_FOOT'" asterisk
mysql -ufreepbxuser -p$dbpass -e "UPDATE freepbx_settings SET value = 'http://www.tier2.tech' WHERE keyword = 'BRAND_IMAGE_SPONSOR_LINK_FOOT'" asterisk
mysql -ufreepbxuser -p$dbpass -e "UPDATE freepbx_settings SET value = 'www.tier2.tech' WHERE keyword = 'BRAND_SPONSOR_ALT_FOOT'" asterisk
mysql -ufreepbxuser -p$dbpass -e "UPDATE freepbx_settings SET value = 'Tier2 Technologies&reg;' WHERE keyword = 'BRAND_FREEPBX_ALT_FOOT'" asterisk
mysql -ufreepbxuser -p$dbpass -e "UPDATE freepbx_settings SET value = 'Tier2 Technologies' WHERE keyword = 'BRAND_FREEPBX_ALT_LEFT'" asterisk
mysql -ufreepbxuser -p$dbpass -e "UPDATE freepbx_settings SET value = 'images/bottom_right.png' WHERE keyword = 'BRAND_IMAGE_SPONSOR_FOOT'" asterisk
mysql -ufreepbxuser -p$dbpass -e "UPDATE freepbx_settings SET value = 'images/bottom_left.png' WHERE keyword = 'BRAND_IMAGE_FREEPBX_FOOT'" asterisk
mysql -ufreepbxuser -p$dbpass -e "UPDATE freepbx_settings SET value = 'images/top_left.png' WHERE keyword = 'BRAND_IMAGE_TANGO_LEFT'" asterisk
mysql -ufreepbxuser -p$dbpass -e "UPDATE freepbx_settings SET value = 'Tier2 PBX Administration' WHERE keyword = 'BRAND_TITLE'" asterisk
mysql -ufreepbxuser -p$dbpass -e "UPDATE freepbx_settings SET value = 'Tier2 PBX' WHERE keyword = 'DASHBOARD_FREEPBX_BRAND'" asterisk
mysql -ufreepbxuser -p$dbpass -e "UPDATE freepbx_settings SET value = 'images/favico.ico' WHERE keyword = 'BRAND_IMAGE_FAVICON'" asterisk
mysql -ufreepbxuser -p$dbpass -e "UPDATE freepbx_settings SET value = 'https://news.google.com/news/rss/?ned=us&gl=US&hl=en' WHERE keyword = 'RSSFEEDS'" asterisk
mysql -ufreepbxuser -p$dbpass -e "UPDATE freepbx_settings SET value = '1' WHERE keyword = 'USE_FREEPBX_MENU_CONF'" asterisk

echo [wiki]>/etc/asterisk/freepbx_menu.conf
echo remove=Yes>>/etc/asterisk/freepbx_menu.conf

wget http://alexspc.com/PBX/branding/favico.ico -O /var/www/html/admin/images/favico.ico
wget http://alexspc.com/PBX/branding/bottom_left.png -O /var/www/html/admin/images/bottom_left.png
wget http://alexspc.com/PBX/branding/top_left.png -O /var/www/html/admin/images/top_left.png
wget http://alexspc.com/PBX/branding/bottom_right.png -O /var/www/html/admin/images/bottom_right.png
wget http://alexspc.com/PBX/branding/custom.css -O /var/www/html/admin/custom.css


fwconsole chown
fwconsole r