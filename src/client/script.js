const link = "http://dcb6-177-37-198-145.ngrok.io/api/";

function limparClientes() {
  let table = document.getElementById("tabela");

  while (table.firstChild) {
    table.removeChild(table.firstChild);
  }

  var row = `<tr class="linha">
    <th scope="col">CPF</th>
    <th scope="col">Nome do cliente</th>
    <th scope="col">RG do cliente</th>
    <th scope="col">UF RG</th>
    <th scope="col">Orgão Emissor do RG</th>
    <th scope="col">Data de nascimento</th>
  </tr>`;

  table.innerHTML += row;
}

function limparFuncionarios() {
  let table = document.getElementById("tabela");

  while (table.firstChild) {
    table.removeChild(table.firstChild);
  }

  var row = `<tr class="linha">
    <th scope="col">Matrícula</th>
    <th scope="col">id Agencia</th>
    <th scope="col">Nome</th>
    <th scope="col">Endereço</th>
    <th scope="col">Cidade</th>
    <th scope="col">Sexo</th>
    <th scope="col">Data de nascimento</th>
    <th scope="col">Salário</th>
    <th scope="col">Cargo</th>
  </tr>`;

  table.innerHTML += row;
}

function limparAgencias() {
  let table = document.getElementById("tabela");

  while (table.firstChild) {
    table.removeChild(table.firstChild);
  }

  var row = `<tr class="linha">
    <th scope="col">Número da agência</th>
    <th scope="col">Nome da agência</th>
    <th scope="col">Salário montante total</th>
    <th scope="col">Cidade agência</th>
  </tr>`;

  table.innerHTML += row;
}

const getTodosAgencias = async () => {
  limparAgencias();
  try {
    const resp = await axios.get(link + "agencia");
    console.log(resp.data);
    var data = resp.data;
  } catch (err) {
    console.error(err);
  }

  var table = document.getElementById("tabela");

  for (var i = 0; i < data.length; i++) {
    if (data[i].salario_montante_total == null) {
      data[i].salario_montante_total = "0";
    }

    var row = `<tr> 
                        <td>${data[i].numero_agencia}</td>
                        <td>${data[i].nome_agencia}</td>
                        <td>${data[i].salario_montante_total}</td>
                        <td>${data[i].cidade_agencia}</td>
                  </tr>`;
    table.innerHTML += row;
  }

  console.log(data);
  document.getElementById("nome").innerHTML = "Agências";
};

const getTodosFuncionarios = async () => {
  limparFuncionarios();
  try {
    const resp = await axios.get(link + "funcionario");
    // console.log(resp.data);
    var data = resp.data;
  } catch (err) {
    console.error(err);
  }

  var table = document.getElementById("tabela");

  for (var i = 0; i < data.length; i++) {
    if (data[i].sexo == "M") {
      data[i].sexo = "Masculino";
    } else if (data[i].sexo == "F") {
      data[i].sexo = "Feminino";
    }

    if (data[i].cargo_funcionario == "G") {
      data[i].cargo_funcionario = "Gerente";
    } else if (data[i].cargo_funcionario == "A") {
      data[i].cargo_funcionario = "Atendente";
    } else if (data[i].cargo_funcionario == "C") {
      data[i].cargo_funcionario = "Caixa";
    }

    var row = `<tr> 
                        <td>${data[i].matricula_funcionario}</td>
                        <td>${data[i].Agencia_idAgencia}</td>
                        <td>${data[i].nome_funcionario}</td>
                        <td>${data[i].endereco_funcionario}</td>
                        <td>${data[i].cidade_funcionario}</td>
                        <td>${data[i].sexo}</td>
                        <td>${data[i].data_nascimento_funcionario
                          .substring(0, 10)
                          .split("-")
                          .reverse()
                          .join("/")}</td>
                        <td>${data[i].salario_funcionario}</td>
                        <td>${data[i].cargo_funcionario}</td>
                  </tr>`;
    table.innerHTML += row;
  }

  console.log(data);
  document.getElementById("nome").innerHTML = "Funcionarios";
};

const getFuncionario = async (matricula) => {
  limparFuncionarios();

  try {
    const resp = await axios.get(`${link}/funcionario`);
    console.log(resp.data);
    var data = resp.data;
  } catch (err) {
    console.error(err);
  }

  var table = document.getElementById("tabela");

  for (var i = 0; i < data.length; i++) {
    var row = `<tr> 
                        <td>${data[i].matricula_funcionario}</td>
                        <td>${data[i].Agencia_idAgencia}</td>
                        <td>${data[i].nome_funcionario}</td>
                        <td>${data[i].endereco_funcionario}</td>
                        <td>${data[i].cidade_funcionario}</td>
                        <td>${data[i].sexo}</td>
                        <td>${data[i].data_nascimento_funcionario
                          .substring(0, 10)
                          .split("-")
                          .reverse()
                          .join("/")}</td>
                        <td>${data[i].salario_funcionario}</td>
                        <td>${data[i].cargo_funcionario}</td>
                  </tr>`;
    table.innerHTML += row;
  }
};

const getTodosCliente = async () => {
  limparClientes();
  try {
    const resp = await axios.get(link + "cliente");
    console.log(resp.data);
    var data = resp.data;
  } catch (err) {
    console.error(err);
  }

  var table = document.getElementById("tabela");

  for (var i = 0; i < data.length; i++) {
    var row = `<tr> 
                        <td>${data[i].CPF}</td>
                        <td>${data[i].nome_cliente}</td>
                        <td>${data[i].RG_cliente}</td>
                        <td>${data[i].RG_UF}</td>
                        <td>${data[i].RG_orgao_emissor}</td>
                        <td>${data[i].data_nascimento_cliente
                          .substring(0, 10)
                          .split("-")
                          .reverse()
                          .join("/")}</td>
                  </tr>`;
    table.innerHTML += row;
  }

  console.log(data);
  document.getElementById("nome").innerHTML = "Clientes";
};

// POSTS

const postCliente = async () => {
  const cpf = document.getElementById("CPF").value;
  const nome_cliente = document.getElementById("nome_cliente").value;
  const RG_cliente = document.getElementById("RG_cliente").value;
  const RG_UF = document.getElementById("RG_UF").value;
  const RG_orgao_emissor = document.getElementById("RG_orgao_emissor").value;
  const data_nascimento_cliente = document.getElementById(
    "data_nascimento_cliente"
  ).value;

  const newPost = {
    CPF: cpf,
    nome_cliente: nome_cliente,
    RG_cliente: RG_cliente,
    RG_UF: RG_UF,
    RG_orgao_emissor: RG_orgao_emissor,
    data_nascimento_cliente: data_nascimento_cliente,
  };

  console.log(newPost);
  try {
    const resp = await axios.post(link + "cliente", newPost);
    console.log(resp.data);
  } catch (err) {
    console.error(err);
  }
  getTodosCliente();
};

const postFuncionario = async () => {
  const matricula_funcionario = document.getElementById(
    "matricula_funcionario"
  ).value;
  const Agencia_idAgencia = document.getElementById("Agencia_idAgencia").value;
  const nome_funcionario = document.getElementById("nome_funcionario").value;
  const senha_funcionario = document.getElementById("senha_funcionario").value;
  const endereco_funcionario = document.getElementById(
    "endereco_funcionario"
  ).value;
  const cidade_funcionario =
    document.getElementById("cidade_funcionario").value;
  const sexo = document.getElementById("sexo").value;
  const data_nascimento_funcionario = document.getElementById(
    "data_nascimento_funcionario"
  ).value;
  const salario_funcionario = document.getElementById(
    "salario_funcionario"
  ).value;
  const cargo_funcionario = document.getElementById("cargo_funcionario").value;
  const quantidade_dependentes = document.getElementById(
    "quantidade_dependentes"
  ).value;

  const newPost = {
    matricula_funcionario: matricula_funcionario,
    Agencia_idAgencia: Agencia_idAgencia,
    nome_funcionario: nome_funcionario,
    senha_funcionario: senha_funcionario,
    endereco_funcionario: endereco_funcionario,
    cidade_funcionario: cidade_funcionario,
    sexo: sexo,
    data_nascimento_funcionario: data_nascimento_funcionario,
    salario_funcionario: salario_funcionario,
    cargo_funcionario: cargo_funcionario,
    quantidade_dependentes: quantidade_dependentes,
  };

  console.log(newPost);
  try {
    const resp = await axios.post(link + "funcionario", newPost);
    console.log(resp.data);
  } catch (err) {
    console.error(err);
  }
  getTodosFuncionarios();
};

const postAgencia = async () => {
  const numero_agencia = document.getElementById("numero_agencia").value;
  const nome_agencia = document.getElementById("nome_agencia").value;
  const cidade_agencia = document.getElementById("cidade_agencia").value;

  const newPost = {
    numero_agencia: numero_agencia,
    nome_agencia: nome_agencia,
    cidade_agencia: cidade_agencia,
  };

  console.log(newPost);
  try {
    const resp = await axios.post(link + "agencia", newPost);
    console.log(resp.data);
  } catch (err) {
    console.error(err);
  }
  getTodosAgencias();
};

function adicionar() {
  if (document.getElementById("nome").innerText == "Clientes") {
    document.getElementById("clienteModal").style.display = "block";
    document.getElementById("funcionarioModal").style.display = "none";
    document.getElementById("agenciaModal").style.display = "none";
    document.getElementById("btclienteModal").style.display = "block";
    document.getElementById("btfuncionarioModal").style.display = "none";
    document.getElementById("btagenciaModal").style.display = "none";
  } else if (document.getElementById("nome").innerText == "Funcionarios") {
    document.getElementById("clienteModal").style.display = "none";
    document.getElementById("funcionarioModal").style.display = "block";
    document.getElementById("agenciaModal").style.display = "none";
    document.getElementById("btclienteModal").style.display = "none";
    document.getElementById("btfuncionarioModal").style.display = "block";
    document.getElementById("btagenciaModal").style.display = "none";
  } else if (document.getElementById("nome").innerText == "Agências") {
    document.getElementById("clienteModal").style.display = "none";
    document.getElementById("funcionarioModal").style.display = "none";
    document.getElementById("agenciaModal").style.display = "block";
    document.getElementById("btclienteModal").style.display = "none";
    document.getElementById("btfuncionarioModal").style.display = "none";
    document.getElementById("btagenciaModal").style.display = "block";
  }
}

function remover() {
  if (document.getElementById("nome").innerText == "Clientes") {
    document.getElementById("pclienteModal").style.display = "block";
    document.getElementById("pfuncionarioModal").style.display = "none";
    document.getElementById("pagenciaModal").style.display = "none";
    document.getElementById("bpclienteModal").style.display = "block";
    document.getElementById("bpfuncionarioModal").style.display = "none";
    document.getElementById("bpagenciaModal").style.display = "none";
  } else if (document.getElementById("nome").innerText == "Funcionarios") {
    document.getElementById("pclienteModal").style.display = "none";
    document.getElementById("pfuncionarioModal").style.display = "block";
    document.getElementById("pagenciaModal").style.display = "none";
    document.getElementById("bpclienteModal").style.display = "none";
    document.getElementById("bpfuncionarioModal").style.display = "block";
    document.getElementById("bpagenciaModal").style.display = "none";
  } else if (document.getElementById("nome").innerText == "Agências") {
    document.getElementById("pclienteModal").style.display = "none";
    document.getElementById("pfuncionarioModal").style.display = "none";
    document.getElementById("pagenciaModal").style.display = "block";
    document.getElementById("bpclienteModal").style.display = "none";
    document.getElementById("bpfuncionarioModal").style.display = "none";
    document.getElementById("bpagenciaModal").style.display = "block";
  }
}

// DELETE
const deleteCliente = async () => {
  cpf = document.getElementById("cpf").value;

  try {
    const resp = await axios.delete(link + "cliente/" + cpf);
    console.log(resp.data);
  } catch (err) {
    // Handle Error Here
    console.error(err);
  }
  getTodosCliente();
};

const deleteFuncionario = async () => {
  matricula = document.getElementById("matricula").value;

  try {
    const resp = await axios.delete(link + "funcionario/" + matricula);
    console.log(resp.data);
  } catch (err) {
    // Handle Error Here
    console.error(err);
  }
  getTodosFuncionarios();
};

const deleteAgencia = async () => {
  numero = document.getElementById("numero").value;

  try {
    const resp = await axios.delete(link + "agencia/" + numero);
    console.log(resp.data);
  } catch (err) {
    // Handle Error Here
    console.error(err);
  }
  getTodosAgencias();
};
