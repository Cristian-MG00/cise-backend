import { NextFunction, Request, Response } from "express";
import jwt from "jsonwebtoken";
import { IUserPayload } from "../interfaces/IUserPayload";
import { env } from "../config/env";
// middleware
const authMiddleware = (req: Request, res: Response, next: NextFunction) => {
  const SECRET_KEY = env().SECRET_KEY as string;

  const header = req.headers.authorization;
  if (!header) {
    return res
      .status(401)
      .json({ success: false, error: "Se requiere el token de acceso" });
  }
  // con split separo los headers creando un array con ellos, al mismo tiempo accedo a la posicion 1 del mismo
  const token = header.split(" ")[1];

  try {
    const payload = jwt.verify(token, SECRET_KEY);
    req.user = payload as IUserPayload;
    next();
  } catch (error) {
    const e = error as Error;
    res.status(401).json({ success: false, error: e.message });
  }
};

export { authMiddleware };
