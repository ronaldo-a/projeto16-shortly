import express from "express";
import { insertUrl, getUrlById, redirectToUrl, deleteUrl } from "../controllers/urlsControllers.js";
import { signUp, signIn } from "../controllers/usersControllers.js";
import { verifyNewUrl, verifyDelete } from "../middlewares/urlsMiddlewares.js";
import { validateSignUp, validateSignIn } from "../middlewares/usersMiddlewares.js";

const router = express.Router();

router.post("/signup", validateSignUp, signUp);
router.post("/signin", validateSignIn, signIn);
router.post("/urls/shorten", verifyNewUrl, insertUrl);
router.get("/urls/:id", getUrlById);
router.get("/urls/open/:shortUrl", redirectToUrl);
router.delete("/urls/:id", verifyDelete, deleteUrl);

export default router;