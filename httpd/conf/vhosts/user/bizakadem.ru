<VirtualHost 127.0.0.1:8080>
	ServerName bizakadem.ru
	ServerAlias www.bizakadem.ru
	DocumentRoot /var/www/user/data/www/fortros_site
	ServerAdmin webmaster@bizakadem.ru
	DirectoryIndex index.php
	AddDefaultCharset off
	AssignUserID user user
	CustomLog /var/www/httpd-logs/bizakadem.ru.access.log combined
	ErrorLog /var/www/httpd-logs/bizakadem.ru.error.log
	Include /etc/httpd/conf/vhosts-resources/user/vhost.conf
	<FilesMatch "\.ph(p[3-5]?|tml)$">
		SetHandler application/x-httpd-php5
	</FilesMatch>
	ScriptAlias /php-bin/ /var/www/php-bin-isp-php53/user/
	AddHandler application/x-httpd-php5 .php .php3 .php4 .php5 .phtml
	Action application/x-httpd-php5 /php-bin/php
	SetEnvIf X-Forwarded-Proto https HTTPS=on
</VirtualHost>
<Directory /var/www/user/data/www/fortros_site>
	Options +Includes -ExecCGI
</Directory>
<Directory /var/www/user/data/www/fortros_site/webstat>
	DirectoryIndex index.html
	AddDefaultCharset UTF-8
</Directory>
