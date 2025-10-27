const express = require("express");
const wrap = require("express-async-error-wrapper");

const router = express.Router();

// Rota da home
router.get("/", wrap(async (req, res) => {
	let jogos = [
		{
			id: 1,
			nome: "Hollow Knight Silksong",
			genero: "Aventura",
			nota: 4.5,
		},
		{
			id: 2,
			nome: "Battlefield 6",
			genero: "Aventura",
			nota: 5.0,
		},
		{
			id: 3,
			nome: "Hades 2",
			genero: "Aventura",
			nota: 3.5,
		},
		{
			id: 4,
			nome: "Plants Vs Zombies: Replanted",
			genero: "Arcade",
			nota: 4.5,
		},
		// {
		// 	id: 5,
		// 	nome: "Stardew valley",
		// 	genero: "Arcade",
		// 	nota: 5.0,
		// }
	];

	let opcoes = {
		jogos: jogos
	};

	res.render("index/index", opcoes);
}));

router.get("/sobre", wrap(async (req, res) => {
	let opcoes = {
		titulo: "Sobre"
	};
	res.render("index/sobre", opcoes);
}));

router.get("/produtos", wrap(async (req, res) => {
	let produtoA = {
		id: 1,
		nome: "Produto A",
		valor: 25
	};

	let produtoB = {
		id: 2,
		nome: "Produto B",
		valor: 15
	};

	let produtoC = {
		id: 3,
		nome: "Produto C",
		valor: 100
	};

	let produtosVindosDoBanco = [ produtoA, produtoB, produtoC ];

	let opcoes = {
		titulo: "Listagem de Produtos",
		produtos: produtosVindosDoBanco
	};

	res.render("index/produtos", opcoes);
}));

module.exports = router;
