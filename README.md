# Rainloop Chef Cookbook
![Alt text](logo/logo.png)

Installs and configures Rainloop Webmail.

## ToDo

* manage w/ Chef even application.ini. Use Template or File resource
* support other OS
* test upgrade of Rainloop through Chef

## Try it w/ Kitchen

```kitchen list ```
```
Instance             Driver   Provisioner  Verifier  Transport  Last Action    Last Error
default-centos-72    Vagrant  ChefZero     Inspec    Ssh        <Not Created>  <None>
```

* Try w/ Centos: ```kitchen converge default-centos-72```

## Tested Platforms

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

