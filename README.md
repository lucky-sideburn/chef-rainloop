# Rainloop Chef Cookbook
![Alt text](logo/logo.png)

Installs and configures Rainloop Webmail.

## ToDo

* manage w/ Chef even application.ini. Use Template or File resource
* support Debian
* test upgrade of Rainloop through Chef

## Try it w/ Kitchen

```kitchen list ```
```
Instance             Driver   Provisioner  Verifier  Transport  Last Action    Last Error
default-ubuntu-1604  Vagrant  ChefZero     Inspec    Ssh        <Not Created>  <None>
default-centos-72    Vagrant  ChefZero     Inspec    Ssh        <Not Created>  <None>
```

* Try w/ Centos: ```kitchen converge default-centos-72```
* Try w/ Ubuntu: ```kitchen converge default-ubuntu-1604```

## Tested Platforms

- Ubuntu
- CentOS

## Requirements

### Chef

- Chef 12.1+

## Attributes

In order to keep the README manageable and in sync with the attributes, this cookbook documents attributes inline. The usage instructions and default values for attributes can be found in the individual attribute files.

## Recipes

### default

Configures Apache Web Server and the Rainloop vhost.

### archive

According with Rainloop documentation (https://www.rainloop.net/docs/installation/) this recipes follows the instructions for the "archive" installation.

