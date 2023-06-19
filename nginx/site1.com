server {
	listen 80;
	listen [::]:80;

	# listen 443 ssl;
	# listen [::]:443 ssl;

	root /var/www/html/site1;

	index index.php;

	server_name site1.com www.site1.com;

	location / {
		try_files $uri $uri/ /index.php?$args;
	}

	location ~ \.php$ {
            include fastcgi.conf;
            fastcgi_intercept_errors on;
            fastcgi_pass php:9000;
	}

	location ~* \.(js|css|png|jpg|jpeg|gif|ico)$ {
            expires max;
            log_not_found off;
        }
	
        # deny access to .htaccess files, if Apache's document root
	# concurs with nginx's one
	#
	#location ~ /\.ht {
	#	deny all;
	#}
}
