const express = require("express");
const wrap = require("express-async-error-wrapper");
const sql = require("../data/sql");
const { platform } = require("os");


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

router.get("/curiosidades", wrap(async (req, res) => {
	let opcoes = {
		titulo: "Curiosidades",
	};


	res.render("index/curiosidades", opcoes);
}));

router.get("/wishlist", wrap(async (req, res) => {
	let usuario
	let jogos
	let avaliacoes
	let plataforma
	let wishlist

	await sql.connect(async sql => {

		usuario = await sql.query(
			`SELECT id_usuario, nm_usuario, email_usuario
			FROM usuario
			WHERE id_usuario = 1
			;`
		);
		usuario = usuario[0];
		jogos = await sql.query(
			`SELECT j.*
			FROM wishlist w
			JOIN jogos j ON j.id_jogo = w.id_jogo
			ORDER BY j.id_jogo DESC;
			;`
		);
		avaliacoes = await sql.query(
			`SELECT a.*
			FROM avaliacoes a
			JOIN wishlist w ON w.id_jogo = a.id_jogo;`
		);
		plataforma = await sql.query(
			`SELECT p.*
			FROM wishlist w
			JOIN jogos j ON j.id_jogo = w.id_jogo
			JOIN plataforma p ON p.id_plataforma = j.id_plataforma;`
		);
		wishlist = await sql.query(
			`SELECT u.* FROM wishlist w
			JOIN usuario u ON w.id_usuario = u.id_usuario;`
		)

	});
	let opcoes = {
		titulo: "Wishlist",
		usuario: usuario,
		jogos: jogos,
		avaliacoes: avaliacoes,
		plataforma: plataforma,
		wishlist: wishlist
	}

	res.render("index/wishlist", opcoes);
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

	for (let i = 0; i < comentarios.lenth; i++) {
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
router.post("/api/cadastrar", wrap(async (req, res) => {

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

router.post("/api/deletar", wrap(async (req, res) => {

	const { id_avaliacao } = req.body;

	await sql.connect(async sql => {

		await sql.query("delete from avaliacoes where id_avaliacao = (?);", [id_avaliacao]);
	});

	res.json(true)
}));


router.post("/api/deletarWishlist", wrap(async (req, res) => {

	const { id_jogo } = req.body;

	await sql.connect(async sql => {

		await sql.query("delete from wishlist where id_jogo = (?);", [id_jogo]);
	});

	res.json(true)
}));

router.post("/api/adicionarWishlist", wrap(async (req, res) => {

	const { id_jogo } = req.body;
	let id_user = 1

	let parametros = [
		id_user,
		id_jogo
		]

	await sql.connect(async sql => {

		await sql.query("insert into wishlist (id_usuario, id_jogo) values(?, ?); ", parametros);
	});

	res.json(true)
}));





module.exports = router;
