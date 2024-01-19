<VirtualHost 127.0.0.1:8080>
	ServerName fort-dev.ru
	DocumentRoot /var/www/user/data/fortros-dev.ru
	ServerAdmin admin@fortros.ru
	AddDefaultCharset off
	AssignUserID user user
	CustomLog /var/www/httpd-logs/fort-dev.ru.access.log combined
	ErrorLog /var/www/httpd-logs/fort-dev.ru.error.log
	Include /etc/httpd/conf/vhosts-resources/user/vhost.conf
	<FilesMatch "\.ph(p[3-5]?|tml)$">
		SetHandler application/x-httpd-php5
	</FilesMatch>
	ScriptAlias /php-bin/ /var/www/php-bin-isp-php53/user/
	AddHandler application/x-httpd-php5 .php .php3 .php4 .php5 .phtml
	Action application/x-httpd-php5 /php-bin/php
	SetEnvIf X-Forwarded-Proto https HTTPS=on
	ServerAlias *.fort-dev.ru
	DirectoryIndex index.php
</VirtualHost>
<Directory /var/www/user/data/fortros-dev.ru>
	Options +Includes -ExecCGI
</Directory>
<Directory /var/www/user/data/fortros-dev.ru/webstat>
	DirectoryIndex index.html
	AddDefaultCharset UTF-8
</Directory>
