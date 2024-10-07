
# Terraform Infrastructure for ECS Fargate Deployment

Este repositório contém o código Terraform para provisionar uma infraestrutura na AWS que implanta um serviço ECS Fargate com balanceamento de carga (ALB), incluindo VPC, subnets, roles IAM e outras dependências necessárias.


## Visão Geral

Este projeto automatiza a implantação de um serviço em contêiner usando AWS ECS Fargate. Ele inclui a criação de uma VPC personalizada, subnets públicas, balanceador de carga de aplicativo (ALB), clusters ECS, definições de tarefas e serviços ECS, além de configurações de segurança e IAM.

## Arquitetura

A infraestrutura provisionada inclui:

- **VPC Personalizada**: Com subnets públicas para acomodar o ALB e as tarefas ECS.
- **Application Load Balancer (ALB)**: Para distribuir o tráfego entre as tarefas ECS.
- **ECS Cluster e Service**: Executando tarefas Fargate com a aplicação em contêiner.
- **IAM Roles e Policies**: Para permitir que as tarefas ECS interajam com outros serviços AWS, como ECR, S3 e CloudWatch Logs.
- **CloudWatch Logs**: Para coletar logs das tarefas ECS.
- **Integração com S3**: Carregamento de variáveis de ambiente a partir de um arquivo no S3 usando \`environmentFiles\`.

## Pré-requisitos

Antes de começar, certifique-se de ter:

- **Conta AWS Ativa**: Com permissões adequadas para criar recursos.
- **AWS CLI Configurado**: Com credenciais e região padrão configuradas.
- **Terraform Instalado**: Versão 0.12 ou superior.
- **Docker**: Para construir e enviar imagens Docker, se necessário.
- **Imagem do Contêiner no ECR**: A imagem Docker da aplicação deve estar disponível no Amazon ECR.

## Estrutura do Projeto

```
.
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── modules
│   ├── vpc
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── iam
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── alb
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── ecs_cluster
│   │   ├── main.tf
│   │   └── variables.tf
│   └── ecs_service
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── templates
│           └── container_definitions.json.tpl
└── README.md
```

## Como Usar

### 1. Clonar o Repositório

```bash
git clone https://github.com/seu-usuario/seu-repositorio.git
cd seu-repositorio
```

### 2. Configurar Variáveis

Edite o arquivo `terraform.tfvars` com os valores apropriados:

```hcl
region                   = "us-west-2"
name                     = "app"
vpc_cidr_block           = "10.0.0.0/16"
public_subnet_count      = 2
listener_port            = 80
container_port           = 8081
health_check_path        = "/health"
health_check_interval    = 30
health_check_timeout     = 5
healthy_threshold        = 2
unhealthy_threshold      = 2
health_check_matcher     = "200-399"
container_name           = "app-container"
image                    = "uri-image"
cpu                      = "256"
memory                   = "512"
desired_count            = 1
environment_file_arn     = "arn:aws:s3:::meu-bucket/minhas-vars.env"
log_group_name           = "/ecs/app-service-logs"
log_retention_in_days    = 7

tags = {
  Environment = "staging"
}
```

### 3. Inicializar o Terraform

```bash
terraform init
```

### 4. Executar o Plano e Aplicar

Verifique o plano de execução:

```bash
terraform plan
```

Se estiver tudo certo, aplique as mudanças:

```bash
terraform apply
```

Digite `yes` quando solicitado.

## Personalização

- **Alterar Recursos**: Modifique as variáveis no `terraform.tfvars` para ajustar o número de subnets, tamanho das instâncias, etc.
- **Adicionar Módulos**: Você pode adicionar módulos adicionais conforme necessário para outros recursos AWS.
- **Segurança**: Revise e ajuste as políticas IAM para atender aos requisitos de segurança da sua organização.

## Limpeza

Para destruir todos os recursos criados pelo Terraform:

```bash
terraform destroy
```

Confirme digitando `yes` quando solicitado.


