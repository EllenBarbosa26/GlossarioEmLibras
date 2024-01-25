function verificarUsuario() {
    var email = document.getElementById("email").value;
    var senha = document.getElementById("senha").value;

    // Verifica se o email e a senha estão corretos
    if (email === "libarsdev@gmail.com" && senha === "librasdev1234") {
      // Se estiverem corretos, redireciona para a página "tamiline"
      window.location.href = "/scr/timeline.html";
    } else {
      // Se estiverem incorretos, exibe uma mensagem de erro
      alert("Email ou senha incorretos. Tente novamente.");
    }
  }

function verificarModerador(){
    var codigo = document.getElementById("codigo").value;

    if (codigo === "libras0237") {
        // Verifica se o código de moderador está correto
        window.location.href = "/scr/timelineM.html";
      } else {
        // Se as credenciais estiverem incorretas, exibe uma mensagem de erro
        alert("Código incorreto. Tente novamente.");
      }
}