import { Router } from "express";
import { AuthController } from "../controllers/authController";

const authRouter = Router();

// http://localhost:3001/auth/register
authRouter.post("/register", AuthController.register);
// http://localhost:3001/auth/login
authRouter.post("/login", AuthController.login);

export { authRouter };
