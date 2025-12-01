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

router.get("/jogo/:id_jogo", wrap(async (req, res) => {

	let id_jogo = req.params.id_jogo;

	let jogos;
	let comentarios;

	await sql.connect(async sql => {

		jogos = await sql.query(
			"SELECT * FROM jogos WHERE id_jogo = (?)", id_jogo
		);
		comentarios = await sql.query(
			"SELECT * FROM avaliacoes where id_jogo = (?)", id_jogo
		);

	});

	for (let i = 0; i < comentarios.lenth; i++ ) {
		html += `
		<hr/>
		<p> ${comentarios[i].desc_avaliacao}
		</p>`
	};
	
	let opcoes = {
		titulo: "",
		jogos: jogos[0],
		comentarios: comentarios
	};

	res.render("index/jogo", opcoes);
}));

router.get("/catalogo", wrap(async (req, res) => {
	let jogos;

	await sql.connect(async sql => {
		// Tudo aqui dentro é executado com a conexão aberta!

		jogos = await sql.query("select * from jogos");
		//...
	});

	let opcoes = {
		titulo: "Catalogo",
		jogos: jogos
	};

	res.render("index/catalogo", opcoes);
}));



// ------------- API -------------------------------//
router.post("/api/cadastrar", (async (req, res) => {

	let avaliacao_jogo = req.body;

	if (!avaliacao_jogo.id_jogo) {
		res.status(400).json("Invalido!");
		return;
	};
	if (!avaliacao_jogo.avaliacao_user) {
		res.status(400).json("Invalido!");
		return;
	};
	if (!avaliacao_jogo.descricao_avaliacao_user) {
		res.status(400).json("Invalido!");
		return;
	}

	await sql.connect(async sql => {
		// Tudo aqui dentro é executado com a conexão aberta!

		let parametros = [
			1,
			avaliacao_jogo.avaliacao_user,
			avaliacao_jogo.descricao_avaliacao_user,
			avaliacao_jogo.id_jogo
		];

		await sql.query("insert into avaliacoes (id_usuario ,nota_avaliacao, desc_avaliacao, id_jogo) values (?,?,?,?)", parametros);

		//...
	});

	res.json(true)

}));

router.post("/api/deletar",(async (req, res) => {

	const { id_avaliacao } = req.body;

	await sql.connect(async sql => {

		await sql.query("delete from avaliacoes where id_avaliacao = (?);", [id_avaliacao]);
	});

	res.json(true)
}));

module.exports = router;
