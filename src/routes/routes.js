import express from "express";
import { insertUrl, getUrlById } from "../controllers/urlsControllers.js";
import { signUp, signIn } from "../controllers/usersControllers.js";
import verifyNewUrl from "../middlewares/urlsMiddlewares.js";
import { validateSignUp, validateSignIn } from "../middlewares/usersMiddlewares.js";

const router = express.Router();

router.post("/signup", validateSignUp, signUp);
router.post("/signin", validateSignIn, signIn);
router.post("/urls/shorten", verifyNewUrl, insertUrl);
router.get("/urls/:id", getUrlById);

export default router;