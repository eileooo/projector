server {
    listen 80;
    listen [::]:80;

    server_name projector.example.com;

    location / {
      proxy_pass http://localhost:9999;
      proxy_http_version 1.1;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection "Upgrade";
      proxy_set_header Host $host;
    }
}
