# tests/integration.tftest.hcl
# Testes de integração de ciclo de vida (Create -> Update -> Destroy).
# Usa mock_provider para permitir validação completa de state e transição
# sem depender de credenciais de nuvem em execuções locais ou CI rápido.
# Para testar contra a nuvem real, comente os blocos mock_provider e configure a api_key.

mock_provider "mgc" {}
mock_provider "tls" {}
mock_provider "local" {}
mock_provider "time" {}

variables {
  name              = "tftest-vm"
  machine_type_name = "BV1-1-10"
  image_name        = "cloud-ubuntu-24.04 LTS"
  ssh_key_create    = true
  ssh_key_name      = "tftest-ssh-key"
  attach_public_ip  = false
  backup_enabled    = false
}

# 1. Ciclo de Criação (Create)
run "create_vm" {
  command = apply

  assert {
    condition     = output.id != null
    error_message = "O ID da VM deve ser preenchido após o provisionamento."
  }

  assert {
    condition     = output.private_ipv4 != null
    error_message = "A VM deve possuir um endereço IPv4 privado atribuído."
  }

  assert {
    condition     = output.ssh_key_name != null
    error_message = "A chave SSH associada deve ser reportada."
  }
}

# 2. Ciclo de Atualização / Edição (Update)
# Adiciona um disco secundário sem destruir a VM existente
run "update_add_volume" {
  command = apply

  variables {
    name              = "tftest-vm"
    machine_type_name = "BV1-1-10"
    image_name        = "cloud-ubuntu-24.04 LTS"
    ssh_key_create    = true
    ssh_key_name      = "tftest-ssh-key"
    attach_public_ip  = false
    backup_enabled    = false

    additional_disk = {
      vdb = {
        name = "data"
        size = 10
        type = "cloud_nvme1k"
      }
    }
  }

  assert {
    condition     = output.id == run.create_vm.id
    error_message = "O ID da VM não deve mudar ao anexar um volume secundário."
  }
}
