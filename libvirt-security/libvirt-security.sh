#!/bin/bash
patch -p2 < libvirt.1.1.4.configure.ac.patch
patch -p2 < libvirt.1.1.4.m4.virt-smack.m4.patch
patch -p2 < libvirt.1.1.4.src.Makefile.am.patch
patch -p2 < libvirt.1.1.4.src.security.security_driver.c.patch
patch -p2 < libvirt.1.1.4.src.security.security_smack.c.patch
patch -p2 < libvirt.1.1.4.src.security.security_smack.h.patch
patch -p2 < libvirt.1.1.4.src.util.vircommand.c.patch
patch -p2 < libvirt.1.1.4.src.util.vircommand.h.patch
