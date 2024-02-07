<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Adicionar Categoria</title>
</head>
<body>

<h2>Adicionar Categoria</h2>

<form action="processar_categoria" method="post">
    <label for="nome">Nome:</label>
    <input type="text" id="nome" name="nome" required>
    <br>

    <label for="descricao">Descrição:</label>
    <textarea id="descricao" name="descricao" rows="4" cols="50" required></textarea>
    <br>

    <input type="submit" value="Adicionar Categoria">
</form>

</body>
</html>

