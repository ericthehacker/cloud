##
 # Copyright © 2015 by David Alger. All rights reserved
 # 
 # Licensed under the Open Software License 3.0 (OSL-3.0)
 # See included LICENSE file for full text of OSL-3.0
 # 
 # http://davidalger.com/contact/
 ##

require_relative 'etc/config.rb'
require_relative 'etc/defaults.rb'

# setup environment constants
BASE_DIR = File.dirname(__FILE__)
VENDOR_BASE = '/vagrant'
VAGRANT_DIR = '/vagrant/machine'
DEVENV_PATH = 'vendor/davidalger/devenv/vagrant'
SHARED_DIR = BASE_DIR + '/.shared'

# verify composer dependencies have been installed
if not File.exist?(DEVENV_PATH + '/vagrant.rb')
  raise "Please run 'composer install' before running vagrant commands."
end

# load vendor libs
$LOAD_PATH.unshift(BASE_DIR + '/' + DEVENV_PATH)
require 'lib/provision'

# load built-in libs
require_relative 'lib/machine.rb'

# begin the configuration sequence
Vagrant.require_version '>= 1.7.4'
Vagrant.configure(2) do |conf|
  configure_common conf

  conf.vm.define :cloud do |node|
    configure_manager_vm node, host: 'cloud', php_version: 70
  end
  
  conf.vm.define :demo do |node|
    configure_fullstack_vm node, host: 'demo'
  end
end
