import express from "express";
import dotenv from "dotenv";

dotenv.config();
const server = express();

server.get("/", (req, res) => res.send("hellooooo"));

server.listen(process.env.PORT, () => console.log(`magic happens at ${process.env.PORT}`));