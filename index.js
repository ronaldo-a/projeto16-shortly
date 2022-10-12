import express from "express";
import dotenv from "dotenv";
import router from "./src/routes/routes.js";

dotenv.config();
const server = express();

server.use(router);

server.get("/", (req, res) => res.send("hellooooo"));

server.listen(process.env.PORT, () => console.log(`magic happens at ${process.env.PORT}`));