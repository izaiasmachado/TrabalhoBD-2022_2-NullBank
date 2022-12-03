# Requisitos do Modelo de Negócio

O sistema deve dar suporte ao cadastro e a manutenção (remoção / alteração) dos dados de todas as
entidades participantes do sistema bancário do NullBank, atendendo ao seguinte enunciado:

Faça o esquema conceitual para um sistema de controle bancário, de acordo com a descrição dada:

## Agência

Para cada agência do sistema, deseja-se armazenar:"

- [ ] numero (id)
- [ ] nome,
- [ ] salário_montante_total (que deve ser calculado / atualizado a cada inserção / atualização / remoção de funcionário na agência)
- [ ] cidade

## Funcionário

- [ ] nome completo
- [ ] matrícula (usada também para login
- [ ] senha (criptografada)
- [ ] endereço
- [ ] cidade
- [ ] cargo (podendo ser gerente, atendente ou caixa)
- [ ] sexo (masculino ou feminino)
- [ ] data de nascimento e
- [ ] salário (não podendo este ser menor que R$2.500,00, salário-base da categoria).

Os funcionários podem ter dependentes cadastrados (no máximo 5), para efeito do plano de saúde.

## Dependente

- [ ] nome completo (único por funcionário)
- [ ] data de nascimento
- [ ] parentesco (se filho(a), cônjuge ou genitor(a))
- [ ] idade (que deve ser calculada)

## Cliente

Cada cliente cadastrado no sistema pode possuir várias contas bancárias, contanto que seja, no máximo, uma por agência. Cada conta conjunta pode pertencer a, no máximo, 2 clientes.

Para os clientes, deseja-se armazenar:

- [ ] o nome completo
- [ ] RG (com um máximo de 15 dígitos)
- [ ] Órgão emissor do RG
- [ ] UF do RG,
- [ ] CPF (sendo este o identificador do cliente, contendo 11 dígitos, sem pontos, traços etc)
- [ ] data de nascimento
- [ ] o endereço (constando de tipo de logradouro, nome do logradouro, número, bairro, CEP, cidade, estado)
- [ ] telefones (podendo ser vários, como residencial, comercial, celular1, celular2 etc, com, no máximo, 11 dígitos cada)
- [ ] e-mails (podendo ser vários também, como particular, comercial etc, cada um com um máximo de 60 caracteres)
- [ ] Suas contas bancárias

## Conta

Dados importantes para as contas dos clientes são

- [ ] número da conta (identificador)
- [ ] o saldo
- [ ] a senha (criptografada)
- [ ] o tipo de conta (que poderá assumir um dos seguintes tipos: conta corrente, conta poupança ou conta especial, onde conta poupança tem uma taxa de juros (percentual) e conta especial tem um limite de crédito, enquanto a conta corrente possui a data de aniversário do contrato como atributo especial)
- [ ] a agência (a qual a conta está vinculada)
- [ ] o gerente (vinculado à conta e que é um funcionário daquela agência)
- [ ] informações sobre o conjunto de transações (cada transação deve armazenar número da transação sendo único por conta, tipo da transação [podendo ser saque, depósito, pagamento, estorno ou transferência], data-hora e valor) associadas à conta.

Observe que o saldo da conta deve iniciar zerado e a cada momento o saldo deve refletir o conjunto de transações que são executadas sobre aquela conta deforma automática, não podendo em nenhum momento o saldo da conta (ou o limite de crédito, se for o caso) ficar negativado.
