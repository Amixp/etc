<VirtualHost 127.0.0.1:8080>
	ServerName fortros.ru
	DocumentRoot /var/www/user/data/www/fortros_site
	ServerAdmin support@fortros.ru
	AddDefaultCharset off
	AssignUserID user user
	CustomLog /var/www/httpd-logs/fortros.ru.access.log combined
	ErrorLog /var/www/httpd-logs/fortros.ru.error.log
	Timeout 3800
	ScriptAlias /cgi-bin/ /var/www/user/data/www/fortros_site/cgi-bin/
	Include /etc/httpd/conf/vhosts-resources/user/vhost.conf
	<FilesMatch "\.ph(p[3-5]?|tml)$">
		SetHandler application/x-httpd-php5
	</FilesMatch>
	ScriptAlias /php-bin/ /var/www/php-bin-isp-php53/user/
	AddHandler application/x-httpd-php5 .php .php3 .php4 .php5 .phtml
	Action application/x-httpd-php5 /php-bin/php
	SetEnvIf X-Forwarded-Proto https HTTPS=on
	ServerAlias *.fortros.ru *.telefort.ru bogdashevsky.ru dalmarket.ru findomdv.ru parket-vl.ru pckbo.com postelclub.ru retort-pack.ru sk-dv.ru telefort.ru www.fortros.ru xn--80aan8banj.xn--p1ai xn--n1aafagdl.xn--p1acf
	DirectoryIndex index.php
</VirtualHost>
<Directory /var/www/user/data/www/fortros_site>
	Options +Includes +ExecCGI
</Directory>
<Directory /var/www/user/data/www/fortros_site/webstat>
	DirectoryIndex index.html
	AddDefaultCharset UTF-8
	Allow from all
	AuthName "Access limited by ISPmanager"
	AuthType Basic
	AuthUserFile /var/www/user/data/etc/access.fortros.ru.VihQs/3k.passwd
	Order allow,deny
	Require valid-user
</Directory>
<Directory /var/www/user/data/www/fortros_site/x/myadmin>
	Allow from all
	AuthName "Access limited by ISPmanager"
	AuthType Basic
	AuthUserFile /var/www/user/data/etc/access.fortros.ru.Wbd/FXj9.passwd
	Order allow,deny
	Require valid-user
</Directory>
<Directory /var/www/user/data/www/fortros_site/x/phhpwiki>
	Allow from all
	AuthName "Access limited by ISPmanager"
	AuthType Basic
	AuthUserFile /var/www/user/data/etc/access.fortros.ru.pdDBi+zI.passwd
	Order allow,deny
	Require valid-user
</Directory>
