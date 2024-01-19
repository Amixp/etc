<VirtualHost 127.0.0.1:8080>
	ServerName megafort.ru
	DocumentRoot /var/www/user/data/fortros-dev.ru
	ServerAdmin webmaster@megafort.ru
	AddDefaultCharset off
	AssignUserID user user
	CustomLog /var/www/httpd-logs/megafort.ru.access.log combined
	ErrorLog /var/www/httpd-logs/megafort.ru.error.log
	Include /etc/httpd/conf/vhosts-resources/user/vhost.conf
	<FilesMatch "\.ph(p[3-5]?|tml)$">
		SetHandler application/x-httpd-php5
	</FilesMatch>
	ScriptAlias /php-bin/ /var/www/php-bin-isp-php53/user/
	AddHandler application/x-httpd-php5 .php .php3 .php4 .php5 .phtml
	Action application/x-httpd-php5 /php-bin/php
	SetEnvIf X-Forwarded-Proto https HTTPS=on
	ServerAlias www.megafort.ru
	DirectoryIndex index.php
</VirtualHost>
<Directory /var/www/user/data/fortros-dev.ru>
	Options +Includes -ExecCGI
</Directory>
