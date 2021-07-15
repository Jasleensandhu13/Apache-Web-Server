# Perl-Server
To install logging service:
``` 
  apt-get install ruby ruby-dev
  gem install clarity 
```

To start logging service:
```
  clarity --username=USER --password=PASSWORD --port=8000 /var/log/apache2
```

Things To Do
 - [ ] Change the database username and password in the CGI files.
 - [ ] Replace the ssl certificate and key with your ones.
 - [ ] Replace the .htpasswd file with your one.
 - [ ] Add request size limit and change the other parameters in apache.conf.
 - [ ] Change user group
 - [ ] Rename variable names(Good to do).
