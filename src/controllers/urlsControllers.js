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

async function getUrlById (req, res) {
    const id = req.params.id;

    const url = (await connection.query(`SELECT id, "shortUrl", "url" FROM "shortenUrls" WHERE id = $1`, [id])).rows[0];
    if (!url) {
        return res.status(404).send("URL não encontrada.");
    }

    return res.status(200).send(url);
}

async function redirectToUrl (req, res) {
    const shortUrl = req.params.shortUrl;

    const url = (await connection.query(`SELECT url, "visitCount" FROM "shortenUrls" WHERE "shortUrl" = $1;`, [shortUrl])).rows[0];
    if (!url) {
        res.status(404).send("URL não encontrada.");
    }

    const visitCount = url.visitCount + 1;
    connection.query(`UPDATE "shortenUrls" SET "visitCount" = ${visitCount} WHERE "shortUrl" = $1;`, [shortUrl]);

    return res.redirect(url.url);
}

async function deleteUrl (req, res) {
    const { urlId } = res.locals.urlData;

    try {
        await connection.query(`DELETE from "shortenUrls" WHERE id = $1`, [urlId]);
        return res.status(204).send("Url excluída com sucesso.");
    } catch (error) {
        return res.status(500).send("Erro de servidor.");
    }
}

export { insertUrl, getUrlById, redirectToUrl, deleteUrl };