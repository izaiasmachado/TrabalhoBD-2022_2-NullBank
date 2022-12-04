const LOGIN_DB = "admin";
const SENHA_DB = "root";

const LOGIN_DBA = "Admin";
const SENHA_DBA = "Root";

const LOGIN_FUNCIONARIO = "qwerty";
const SENHA_FUNCIONARIO = "12345";

function loginInicial() {
  const usuario = LOGIN_DB;
  const senha = SENHA_DB;

  if (
    document.getElementById("fname").value == usuario &&
    document.getElementById("lname").value == senha
  ) {
    window.location.href = "./loginFuncionario.html";
  } else {
    window.location.reload();
    alert("Credenciais erradas!");
  }
}

function loginFuncionario() {
  const usuario = LOGIN_FUNCIONARIO;
  const senha = SENHA_FUNCIONARIO;

  if (
    document.getElementById("fname").value == usuario &&
    document.getElementById("lname").value == senha
  ) {
    window.location.href = "./tabelaFuncionario.html";
  } else {
    window.location.reload();
    alert("Credenciais erradas!");
  }
}

function loginDBA() {
  const usuario = LOGIN_DBA;
  const senha = SENHA_DBA;
  if (
    document.getElementById("fname").value == usuario &&
    document.getElementById("lname").value == senha
  ) {
    window.location.href = "./tabelas.html";
  } else {
    window.location.reload();
    alert("Credenciais erradas!");
  }
}
