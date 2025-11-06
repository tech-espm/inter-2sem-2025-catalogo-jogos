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
		{
			id: 5,
			nome: "Stardew valley",
			genero: "Arcade",
			nota: 5.0,
		},
		{
			id: 6,
			nome: "Mario Kart World",
			genero: "Arcade",
			nota: 5.0,
		},
		{
			id: 7,
			nome: "Escape from Duckov",
			genero: "Arcade",
			nota: 4.0,
		},
		{
			id: 8,
			nome: "Jurassic World Evolution 3",
			genero: "Arcade",
			nota: 5.0,
		},

	];

	let opcoes = {
		jogos: jogos
	};

	res.render("index/index", opcoes);
}));

router.get("/jogo", wrap(async (req, res) => {
	let id = parseInt(req.query["id"]);

	let jogo = {
		id: id,
		nome: "Hollow Knight Silksong",
		genero: "Aventura",
		nota: 4.5,
	};

	let opcoes = {
		titulo: jogo.nome,
		jogo: jogo
	};

	res.render("index/jogo", opcoes);
}));

router.get("/sobre", wrap(async (req, res) => {
	let opcoes = {
		titulo: "Sobre",
	};


	res.render("index/sobre", opcoes);
}));

router.get("/wishlist", wrap(async (req, res) => {

	let usuario = {
		id_user: 1,
		nome_usuario: "Rafel",
		genero_fav: "Ação",
		wishlist: [
			{
				id_wishlist: 1,
				id_jogo: 5,
				nm_jogo: "Stardew Valley"
			},
			{
				id_wishlist: 2,
				id_jogo: 6,
				nm_jogo: "Hollow Knight: Silksong"
			}
		]
	};


	let produtosVindosDoBanco = usuario;

	let opcoes = {
		titulo: "Listagem de Produtos",
		produtos: produtosVindosDoBanco
	};

	res.render("index/wishlist", usuario);
}));

module.exports = router;
