# Some Php requirements..
default['rainloop']['php']['extensions'] = %w(HTTP_Request2 Services_JSON)

# Attibutes for Rainloop archive used in ARK
default['rainloop']['archive']['url'] = 'https://www.rainloop.net/repository/webmail/rainloop-community-latest.zip'
default['rainloop']['archive']['checksum'] = '371121744dfb4604f91ef87a8a2b497ecc69e001974c5890980fcd4a7cf3b408'
default['rainloop']['archive']['version'] = '1.11.0.203'

case node['platform']
when 'centos'
  default['rainloop']['user'] = 'apache'
  default['rainloop']['group'] = 'apache'
when 'ubuntu'
  default['rainloop']['user'] = 'www-data'
  default['rainloop']['group'] = 'www-data'
end

# Document root of Rainloop
default['rainloop']['base'] = '/var/www/html/webmail'

# Server Name. The default is the name of the server
default['rainloop']['server_alias'] = 'webmail.local'

default['rainloop']['domains'] = {
  'noodles.local' => {
    'imap_host' => 'imap.noodles.local',
    'imap_port' => 993,
    'imap_secure' => 'SSL',
    'imap_short_login' => 'On',
    'sieve_use' => 'Off',
    'sieve_allow_raw' => 'Off',
    'sieve_host' => '',
    'sieve_port' => 4190,
    'sieve_secure' => 'None',
    'smtp_host' => 'smtp.noodles.local',
    'smtp_port' => 465,
    'smtp_secure' => 'SSL',
    'smtp_short_login' => 'On',
    'smtp_auth' => 'On',
    'smtp_php_mail' => 'Off',
    'white_list' => ''
  },
  'foobar.local' => {
    'imap_host' => 'imap.foobar.local',
    'imap_port' => 993,
    'imap_secure' => 'SSL',
    'imap_short_login' => 'On',
    'sieve_use' => 'Off',
    'sieve_allow_raw' => 'Off',
    'sieve_host' => '',
    'sieve_port' => 4190,
    'sieve_secure' => 'None',
    'smtp_host' => 'smtp.foobar.local',
    'smtp_port' => 465,
    'smtp_secure' => 'SSL',
    'smtp_short_login' => 'On',
    'smtp_auth' => 'On',
    'smtp_php_mail' => 'Off',
    'white_list' => ''
  },
  'iugin.local' => {
    'imap_host' => 'imap.iugin.local',
    'imap_port' => 993,
    'imap_secure' => 'SSL',
    'imap_short_login' => 'On',
    'sieve_use' => 'Off',
    'sieve_allow_raw' => 'Off',
    'sieve_host' => '',
    'sieve_port' => 4190,
    'sieve_secure' => 'None',
    'smtp_host' => 'smtp.iugin.local',
    'smtp_port' => 465,
    'smtp_secure' => 'SSL',
    'smtp_short_login' => 'On',
    'smtp_auth' => 'On',
    'smtp_php_mail' => 'Off',
    'white_list' => ''
  }
}
