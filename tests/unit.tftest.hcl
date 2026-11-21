# tests/unit.tftest.hcl
# Testes unitários com mock_provider que rodam sem necessidade de credenciais ou rede,
# validando a integridade da lógica, condicionais e saídas do módulo.

mock_provider "mgc" {}
mock_provider "tls" {}
mock_provider "local" {}
mock_provider "time" {}

variables {
  name              = "unit-test-vm"
  machine_type_name = "BV1-1-10"
  image_name        = "cloud-ubuntu-24.04 LTS"
  ssh_key_create    = false
  ssh_key_name      = "dummy-key"
}

# 1. Valida se o módulo não quebra quando create = false
run "verify_create_false" {
  command = plan

  variables {
    create = false
  }

  assert {
    condition     = output.id == null
    error_message = "O output 'id' deveria ser nulo quando create = false"
  }

  assert {
    condition     = output.public_ipv4 == null
    error_message = "O output 'public_ipv4' deveria ser nulo quando create = false"
  }
}

# 2. Valida o comportamento com configurações padrão
run "verify_default_plan" {
  command = plan

  assert {
    condition     = length(output.name) > 0
    error_message = "O nome da VM deve ser gerado ou atribuído."
  }

  assert {
    condition     = length(local.resulting_security_group_ids) == 0
    error_message = "Por padrão sem security groups definidos, a lista deve ser vazia."
  }
}

# 3. Valida se vpc_id tem prioridade sobre vpc_name
run "verify_vpc_id_priority" {
  command = plan

  variables {
    vpc_id   = "custom-vpc-uuid-1234"
    vpc_name = "vpc_default"
  }

  assert {
    condition     = local.vpc_default_id == "custom-vpc-uuid-1234"
    error_message = "O local.vpc_default_id deve priorizar var.vpc_id quando informado."
  }
}

# 4. Valida suporte a subnet_id
run "verify_subnet_id" {
  command = plan

  variables {
    subnet_id = "subnet-uuid-5678"
  }

  assert {
    condition     = output.subnet_id == "subnet-uuid-5678"
    error_message = "O output subnet_id deve refletir a sub-rede informada."
  }
}

# 5. Valida a mesclagem e deduplicação de security_group_ids
run "verify_security_group_ids" {
  command = plan

  variables {
    create             = false
    security_group_ids = ["sg-id-1", "sg-id-2", "sg-id-1"]
  }

  assert {
    condition     = length(local.resulting_security_group_ids) == 2
    error_message = "Os IDs de Security Group duplicados devem ser deduplicados pelo distinct."
  }
}
