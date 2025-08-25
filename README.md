# Terraform AWS EC2 Example

Este repositório contém um exemplo de configuração Terraform para criar uma instância EC2 na AWS com Ubuntu, usando perfil IAM com permissões para acessar o Amazon S3. O código é modular e configurável através de variáveis, servindo como referência para aprender conceitos básicos de Terraform, AWS EC2 e IAM.

---

## 🚀 Funcionalidades

- Criação de instância EC2 Ubuntu 20.04 LTS.
- Configuração de IAM Role e Instance Profile para EC2.
- Anexo de política gerenciada `AmazonS3FullAccess` à instância.
- Volume raiz personalizado (251 GB).
- Associação de IP público.
- Configuração de security group via variável.
- Tagging da instância para fácil identificação.

---

## ⚙️ Variáveis

O projeto utiliza variáveis para facilitar a configuração:

| Variável             | Descrição                                      | Default |
|----------------------|-----------------------------------------------|---------|
| `region`             | Região AWS onde a instância será criada      | `--`    |
| `key_name`           | Nome da chave SSH a ser usada                 | `--`    |
| `private_key_path`   | Caminho da chave privada                       | `--`    |
| `instance_type`      | Tipo da instância EC2                          | `--`    |
| `security_group_id`  | ID do Security Group                           | `--`    |
| `name`               | Nome do Role IAM e Instance Profile           | `ec2-role` |

---

## 📦 Estrutura do Projeto

```text
.
├── main.tf          # Configuração principal do Terraform
├── variables.tf     # Declaração das variáveis
├── outputs.tf       # Outputs (opcional)
└── README.md        # Documentação
```
## 🛠️ Como Usar


Configure as variáveis no arquivo terraform.tfvars (opcional) ou defina manualmente no terminal:
```
region = "us-east-1"
key_name = "minha-chave-ssh"
private_key_path = "~/.ssh/minha-chave.pem"
instance_type = "t3.micro"
security_group_id = "sg-0123456789abcdef0"
name = "ec2-role"
```

Inicialize o Terraform:
```
terraform init

```
Planeje a execução:
```
terraform plan
```

Aplique as mudanças:
```
terraform apply
```
Para destruir os recursos:
```
terraform destroy
```
## 🔐 IAM Role

A instância EC2 criada terá um IAM Role com a seguinte política:

AmazonS3FullAccess → Permite acesso total aos buckets e objetos S3.

## 📚 Aprendizado

Este projeto é útil para:

Praticar a criação de instâncias EC2 com Terraform.

Entender como associar IAM Roles e policies.

Aprender boas práticas de modularidade e uso de variáveis no Terraform.

## ⚠️ Observações

Este código não inclui configuração de firewall detalhada (security group deve ser configurado externamente).

Utilize uma chave SSH válida para acessar a instância.

O uso da política AmazonS3FullAccess é apenas para testes; em produção, siga o princípio do menor privilégio.