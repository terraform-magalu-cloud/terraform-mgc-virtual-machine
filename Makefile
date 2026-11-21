.PHONY: all init plan apply destroy clean fmt validate docs pre-commit test test-unit test-integration

# Define o diretório onde os comandos do terraform serão executados.
# Padrão: examples/simple (comum para testar módulos)
# Uso: make plan DIR=./caminho/do/exemplo
DIR ?= examples/simple
DIR2 ?= examples/advanced


all: docs fmt pre-commit init validate test-unit plan

init:
	@echo "Inicializando Terraform em $(DIR)..."
	terraform init -upgrade
	cd $(DIR) && terraform init -upgrade && cd -
	cd $(DIR2) && terraform init -upgrade && cd -

plan:
	@echo "Gerando plano de execução em $(DIR)..."
	cd $(DIR) && terraform plan && cd -
	cd $(DIR2) && terraform plan && cd -


apply:
	@echo "Aplicando mudanças em $(DIR)..."
	cd $(DIR) && terraform apply -auto-approve && cd -
	cd $(DIR2) && terraform apply -auto-approve && cd -


destroy:
	@echo "Destruindo recursos em $(DIR)..."
	cd $(DIR) && terraform destroy -auto-approve && cd -
	cd $(DIR2) && terraform destroy -auto-approve && cd -

fmt:
	@echo "Formatando arquivos Terraform recursivamente..."
	terraform fmt -recursive

validate:
	@echo "Validando configuração..."
	terraform validate
	cd $(DIR) && terraform validate && cd -
	cd $(DIR2) && terraform validate && cd -

test:
	@echo "Executando todos os testes do módulo com terraform test..."
	terraform test

test-unit:
	@echo "Executando testes unitários mockados (sem chamadas de rede)..."
	terraform test -filter=tests/unit.tftest.hcl

test-integration:
	@echo "Executando testes de integração E2E..."
	terraform test -filter=tests/integration.tftest.hcl

test-unit-integration: test

clean:
	@echo "Limpando arquivos de cache (.terraform), locks e estados..."
	find . -type d -name ".terraform" -prune -exec rm -rf {} +
	find . -type f -name ".terraform.lock.hcl" -delete
	find . -type f -name "*.tfstate" -delete
	find . -type f -name "*.tfstate.backup" -delete

pre-commit:
	@echo "Executando pre-commit hooks..."
	pre-commit run --all-files

docs:
	@echo "Gerando documentação com terraform-docs..."
	terraform-docs .
	cd $(DIR) && terraform-docs . && cd -
	cd $(DIR2) && terraform-docs . && cd -