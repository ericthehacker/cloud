conf.vm.define :demo do |node|
  machine_fullstack_vm node, host: 'demo'
  
  mage2_install node, host: 'demo.classyllama.net', db_name: 'mage2_demo'
end
