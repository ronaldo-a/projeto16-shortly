import { v4 as uuid } from "uuid";
import connection from "../db.js";

async function signUp (req, res) {
    const {name, email, password} = res.locals.newUser;

    const encryptedPassword = bcrypt.hashSync(password, 10);

    try {
        await connection.query(`INSERT INTO users (name, email, "encryptedPassword") VALUES 
        ($1, $2, $3)`, [name, email, encryptedPassword]);

        return res.sendStatus(201);
    } catch (error) {
        return res.status(500).send("Server error");
    }    
}

async function signIn (req, res) {
    const { userId } = res.locals;
    
    const token = uuid();
    try {
        await connection.query(`INSERT INTO sessions ("userId", token) VALUES ($1, $2);`, [userId, token]);
        return res.status(200).send(token);
    } catch (error) {
        res.send(500).send("Server error.");
    }
}

export {signUp, signIn};