server {
    listen 80;
    listen [::]:80;
    server_name site1 www.site1;
    return 302 https://$server_name$request_uri;
}

server {
	listen 443 ssl;
	listen [::]:443 ssl;

        ssl_certificate         /etc/ssl/site1-cert.pem;
        ssl_certificate_key     /etc/ssl/site1-key.pem;
        ssl_client_certificate  /etc/ssl/cloudfare.crt;
        ssl_verify_client on;

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
