import express from "express";
import { insertUrl, getUrlById, redirectToUrl, deleteUrl, getUrlsByUser, getRanking } from "../controllers/urlsControllers.js";
import { signUp, signIn } from "../controllers/usersControllers.js";
import { verifyNewUrl, verifyDelete, verifyUser } from "../middlewares/urlsMiddlewares.js";
import { validateSignUp, validateSignIn } from "../middlewares/usersMiddlewares.js";

const router = express.Router();

router.post("/signup", validateSignUp, signUp);
router.post("/signin", validateSignIn, signIn);
router.post("/urls/shorten", verifyNewUrl, insertUrl);
router.get("/urls/:id", getUrlById);
router.get("/urls/open/:shortUrl", redirectToUrl);
router.delete("/urls/:id", verifyDelete, deleteUrl);
router.get("/users/me", verifyUser, getUrlsByUser);
router.get("/ranking", getRanking);

export default router;