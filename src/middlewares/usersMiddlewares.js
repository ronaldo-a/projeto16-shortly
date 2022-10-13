import Joi from "joi";
import bcrypt from "bcrypt";
import connection from "../db.js";

const signUpSchema = Joi.object ({
    name: Joi.string().empty(" ").required(),
    email: Joi.string().email().required(),
    password: Joi.string().empty(" ").min(6).required(),
    confirmPassword: Joi.string().empty(" ").min(6).required()
}   
);

const signInSchema = Joi.object ({
    email: Joi.string().email().required(),
    password: Joi.string().empty(" ").min(6).required()
}   
);

async function validateSignUp (req, res, next) {

    const {email, password, confirmPassword} = req.body;

    const validation = signUpSchema.validate(req.body, {abortEarly: false});

    const isEmail = (await connection.query(`SELECT * FROM users WHERE email = $1`, [email])).rows[0];
    if (isEmail) {
        return res.sendStatus(409);
    }
    
    if (validation.error) {
        const errors = validation.error.details.map(detail => detail.message);
        return res.status(422).send(errors);
    }

    if (password !== confirmPassword) {
        return res.status(422).send("Password and confirmPassword must be the same.");
    }

    res.locals.newUser = req.body;
    next();
}

async function validateSignIn (req, res, next) {
    const { email, password } = req.body;
    
    const validation = signInSchema.validate(req.body);
    if (validation.error) {
        const errors = validation.error.details.map(detail => detail.message);
        return res.status(422).send(errors);
    }

    const userInfo = (await connection.query(`SELECT id as "userId", "encryptedPassword" FROM users WHERE email = $1`, [email])).rows[0];
    if (userInfo === undefined) {
        return res.status(401).send("email or password incorrect.");
    }

    const { userId, encryptedPassword } = userInfo;
    const checkPassword = bcrypt.compareSync(password, encryptedPassword);
    if (!checkPassword) {
        return res.status(401).send("email or password incorrect.");
    }

    res.locals.userId = userId;
    next();
}

export { validateSignUp, validateSignIn };