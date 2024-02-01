function index() {
    window.location.href = "index.jsp";
}

function faleconosco() {
    window.location.href = "faleconosco.jsp";
}

function login() {
    window.location.href = "login.jsp";
}

const cadastro = document.querySelector(".Cadastro");

function cadastrar() {
    cadastro.style.display = "flex";
}

/*Script janela modal*/
function abrirmodal() {
  const modal = document.getElementById('janela-modal')
  modal.classList.add('abrir')

  modal.addEventListener('click', (e) => {

    if (e.target.id == 'fechar' || e.target.id == 'janela-modal'){
      modal.classList.remove('abrir')
    }
  })
}