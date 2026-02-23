.PHONY: all init plan apply destroy clean fmt validate

# Define o diretório onde os comandos do terraform serão executados.
# Padrão: examples/simple (comum para testar módulos)
# Uso: make plan DIR=./caminho/do/exemplo
DIR ?= examples/simple
DIR2 ?= examples/advanced


all: fmt init validate plan

init:
	@echo "Inicializando Terraform em $(DIR)..."
	terraform init
	cd $(DIR) && terraform init && cd -
	cd $(DIR2) && terraform init && cd -

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

clean:
	@echo "Limpando arquivos de cache (.terraform), locks e estados..."
	find . -type d -name ".terraform" -prune -exec rm -rf {} +
	find . -type f -name ".terraform.lock.hcl" -delete
	find . -type f -name "*.tfstate" -delete
	find . -type f -name "*.tfstate.backup" -delete