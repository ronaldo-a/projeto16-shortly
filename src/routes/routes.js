import express from "express";
import signUp from "../controllers/usersControllers.js";
import validateSignUp from "../middlewares/usersMiddlewares.js";

const router = express.Router();

router.post("/signup", validateSignUp, signUp);

export default router;