import bcrypt from "bcrypt";
import connection from "../db.js";

async function signUp (req, res) {
    const {name, email, password} = res.locals.newUser;

    const encryptedPassword = bcrypt.hashSync(password, 10);

    try {
        const query = await connection.query(`INSERT INTO users (name, email, "encryptedPassword") VALUES 
        ($1, $2, $3)`, [name, email, encryptedPassword]);

        return res.sendStatus(201);
    } catch (error) {
        return res.status(500).send("Server error");
    }    
}

export default signUp;