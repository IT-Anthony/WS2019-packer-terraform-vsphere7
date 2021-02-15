# Script permettant de déployer X VMs sur hôte ESXi 7 via template créé par Packer
# Mairien Anthony - Notamax
# Mis à jour le 15-02-21

# Définition du provider (ici esxi-01)
provider "vsphere" {
  user           = "administrator@notamax.local"
  password       = "Password!"
  vsphere_server = "192.168.1.90"

  # Si certificat auto-signé
  allow_unverified_ssl = true
}

# Création variable pour nombre de VMs à déployer (récupéré via l'argument -var 'nombre=X')
variable "nombre" {
  type = number
}

data "vsphere_datacenter" "dc" {
  name = "NOTAMAX-BRUXELLES"
}

data "vsphere_datastore" "datastore" {
  name          = "truenas-01"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "BE-01"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "Win2019"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "vm" {
  count             = var.nombre
  name             = "Win2019-0${count.index}"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 2
  memory   = 1024
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
    }
}
