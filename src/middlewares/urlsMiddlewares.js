import Joi from "joi";
import connection from "../db.js";

const urlSchema = Joi.object({
    url: Joi.string().uri().required()
});

async function verifyNewUrl (req, res, next) {
    const { url } = req.body;
    const token = req.headers?.authorization?.replace("Bearer ", "");

    const validation = urlSchema.validate(req.body);
    if (validation.error) {
        const errors = validation.error.details.map(detail => detail.message);
        return res.status(422).send(errors);
    }

    const userId = (await connection.query(`SELECT "userId" FROM sessions WHERE token = $1`, [token])).rows[0];
    if (!userId) {
        return res.status(401).send("Usuário não está logado.");
    }
    
    res.locals.urlData = {url, userId: userId.userId};
    next();
}

async function verifyDelete (req, res, next) {
    const token = req.headers?.authorization?.replace("Bearer ", "");
    const id = req.params.id;
 
    const userId = (await connection.query(`SELECT "userId" FROM sessions WHERE token = $1`, [token])).rows[0];
    if (!userId) {
        return res.status(401).send("Usuário não está logado.");
    }

    const urlUserId = (await connection.query(`SELECT "userId", id FROM "shortenUrls" WHERE id = $1`, [id])).rows[0];
    if (!urlUserId) {
        return res.status(404).send("URL não encontrada.");
    } else if (urlUserId.userId !== userId.userId) {
        return res.status(401).send("Não permitido.");
    }

    res.locals.urlData = {urlId: urlUserId.id};
    next();
}

async function verifyUser (req, res, next) {
    const token = req.headers?.authorization?.replace("Bearer ", "");
    if (!token) {
        return res.status(401).send("Não autorizado. Logar novamente.")
    }
 
    const userId = (await connection.query(`SELECT "userId" FROM sessions WHERE token = $1`, [token])).rows[0];
    if (!userId) {
        return res.status(404).send("Usuário não encontrado.");
    }
 
    res.locals.userId = userId;
    next();
}

export { verifyNewUrl, verifyDelete, verifyUser };