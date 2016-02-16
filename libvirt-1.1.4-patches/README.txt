
For libvirt 1.1.4 and  Linux Kernel 3.12.0

The patchs will integrate Linux Kernel's SMACK(Simplified Mandatory Access Control Kernel) to VMs deployment,implement strong isolation for VMs.


1 Files

  libvirt-security/: Patch for libvirt
  smack-sockcreate/: Patch for Linux Kernel Smack module

  Please download libvirt-1.1.4 | linux-3.12 | smack-usespace

  libvirt-1.1.4/
  linux-3.12/
  smack-usespace/ : https://github.com/smack-team/smack


2 Prepare

  2.1 Add patchs

      $cp libvirt-security/* libvirt-1.1.4/
      $cd libvirt-1.1.4/
      $sudo ./libvirt-install.sh
      $./libvirt-security.sh

      $cp smack-sockcreate/* linux-3.12/
      $cd smack-sockcreate/
      $./smack-sockcreate.sh


3 Deployment

  3.1 Install Smack  
 
      Reference: https://help.ubuntu.com/community/SmackConfiguration

      3.1.1 Rebuild kernel / install
            Security options->SMACK kernel Support
	        Netwroking support->Networking options->NetLabel subsystem support

      3.1.2 Modify /boot/grub2/grub.cfg
            linux: /vmlinuz-3.12.0 root=/dev/mapper/fedora-root ro rd.lvm.lv=fedora/swap rd.md=0 rd.dm=0 vconsole.keymap=us rd.luks=0 vconsole.font=latarcyrheb-sun16 rd.lvm.lv=fedora/root rhgb quiet security=smack LANG=zh_CN.UTF-8
	    
      3.1.3 Create directories: /smack,/etc/smack and rules file /etc/smack/accesses
	        Add next line to file /etc/fstab to get the Smack control interface mounted at boot
	        smackfs /smack smackfs defaults 0 0

      3.1.4 Install Smack userspace
        
            $cd smack-userspace/
	        $./autogen.sh
	        $./configure
	        $make
	        $sudo make install

  3.2 Install libvirt

      $cd libvirt-1.1.4/
      $./libvirt-config.sh
      $./autogen.sh -system
      $make
      $sudo make install

      $sudo chkconfig libvirtd on
      $sudo service libvirtd start

4 Restart OS


5 Smack rules
  Smack rules can be customed in /etc/smack/accesses, to run "$smackload /etc/smack/accesses" to load rules
  
6 References
  http://schaufler-ca.com/description_from_the_linux_source_tree
  https://wiki.tizen.org/wiki/Security:SmackNetworking
  https://github.com/smack-team/smack
  http://libvirt.org/drvqemu.html
  http://libvirt.org/internals.html
  https://help.ubuntu.com/community/SmackConfiguration
  
  
  
  

