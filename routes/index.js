const express = require("express");
const wrap = require("express-async-error-wrapper");
const sql = require("../data/sql");


const router = express.Router();

// Rota da home
router.get("/", wrap(async (req, res) => {
	let jogos;

	await sql.connect(async sql => {
		// Tudo aqui dentro é executado com a conexão aberta!

		jogos = await sql.query("select * from jogos");
		//...
	});

	let opcoes = {
		jogos: jogos
	};

	res.render("index/index", opcoes);
}));

router.get("/perfil", wrap(async (req, res) => {

	let opcoes = {
		titulo: "Perfil"
	};

	res.render("index/perfil", opcoes);
}));

router.get("/sobre", wrap(async (req, res) => {
	let opcoes = {
		titulo: "Sobre",
	};


	res.render("index/sobre", opcoes);
}));

router.get("/wishlist", wrap(async (req, res) => {

	let pessoas;

	await sql.connect(async sql => {
		// Tudo aqui dentro é executado com a conexão aberta!
		pessoas = await sql.query("select id, nome, email, telefone from pessoa");
		//...
	})


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

router.get("/login", wrap(async (req, res) => {

	let opcoes = {
		titulo: "Login",
		layout: "layout_secundario"
	};

	res.render("index/login", opcoes);
}));

router.get("/cadastro", wrap(async (req, res) => {

	let opcoes = {
		titulo: "Cadastro",
		layout: "layout_secundario"
	};

	res.render("index/cadastro", opcoes);
}));

router.get("/jogo", wrap(async (req, res) => {
	let opcoes = {
		titulo: "",
	};

	res.render("index/jogo", opcoes);
}));

router.post("/api/cadastrar", wrap(async (req, res) => {

	let avalicao_jogo = req.body;

	if (!avalicao_jogo.avaliacao_user) {
		res.status(400).json("Invalido!");
		return;
	};
	if (!avalicao_jogo.descricao_avaliacao_user) {
		res.status(400).json("Invalido!");
		return;
	}

	await sql.connect(async sql => {
		// Tudo aqui dentro é executado com a conexão aberta!

		let parametros = [
			avalicao_jogo.avaliacao_user,
			avalicao_jogo.descricao_avaliacao_user
		];

		await sql.query("insert into jogos_avaliados (avaliacao_user, descricao_avaliacao_user) values (?,?)", parametros);

		//...
	});

	res.json(True)

}));


module.exports = router;
