import { nanoid } from "nanoid";
import connection from "../db.js";

async function insertUrl (req, res) {
    const { url, userId } = res.locals.urlData;

    const shortedUrl = nanoid(8);

    try {
        await connection.query(`INSERT INTO "shortenUrls" ("userId", url, "shortUrl") 
        VALUES (${userId}, $1, '${shortedUrl}')`, [url]);
        
        const shortUrl = {shortUrl: shortedUrl};
        return res.status(201).send(shortUrl);
    } catch (error) {
        return res.sendStatus(500);
    }

}

export default insertUrl;