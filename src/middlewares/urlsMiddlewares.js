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

export default verifyNewUrl;