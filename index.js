import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import router from "./src/routes/routes.js";

dotenv.config();
const server = express();

//TESTING

server.use(express.json());
server.use(cors());
server.use(router);

server.get("/", (req, res) => res.send("hellooooo"));

server.listen(process.env.PORT, () => console.log(`magic happens at ${process.env.PORT}`));