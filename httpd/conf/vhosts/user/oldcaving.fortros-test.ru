<VirtualHost 127.0.0.1:8080>
	ServerName oldcaving.fortros-test.ru
	DocumentRoot /var/www/user/data/www/oldcaving.fortros-test.ru
	ServerAdmin admin@fortros.ru
	AddDefaultCharset off
	AssignUserID user user
	CustomLog /var/www/httpd-logs/oldcaving.fortros-test.ru.access.log combined
	ErrorLog /var/www/httpd-logs/oldcaving.fortros-test.ru.error.log
	Include /etc/httpd/conf/vhosts-resources/user/vhost.conf
	<FilesMatch "\.ph(p[3-5]?|tml)$">
		SetHandler application/x-httpd-php5
	</FilesMatch>
	ScriptAlias /php-bin/ /var/www/php-bin-isp-php53/user/
	AddHandler application/x-httpd-php5 .php .php3 .php4 .php5 .phtml
	Action application/x-httpd-php5 /php-bin/php
	SetEnvIf X-Forwarded-Proto https HTTPS=on
	ServerAlias www.oldcaving.fortros-test.ru
	DirectoryIndex index.html
</VirtualHost>
<Directory /var/www/user/data/www/oldcaving.fortros-test.ru>
	Options +Includes -ExecCGI
</Directory>
