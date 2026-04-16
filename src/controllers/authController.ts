import { Request, Response } from "express";
import { User } from "../model/UserModel";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import { env } from "../config/env";

class AuthController {
  static register = async (
    req: Request,
    res: Response,
  ): Promise<Response | void> => {
    try {
      const body = req.body;
      const { email, password } = body;
      if (!email || !password) {
        return res.status(400).json({
          success: false,
          error: "Debes ingresar un email y una contraseña",
        });
      }
      const user = await User.findOne({ email });
      if (user) {
        return res
          .status(409)
          .json({ success: false, error: "El usuario ya esta registrado" });
      }

      // crear el hash de la contraseña
      const hash = await bcrypt.hash(password, 10);

      const newUser = new User({
        email,
        password: hash,
      });
      await newUser.save();
      res.status(201).json({ success: true, data: newUser });
    } catch (error) {
      const e = error as Error;
      res.status(400).json({ success: false, error: e.name });
    }
  };
  static login = async (
    req: Request,
    res: Response,
  ): Promise<Response | void> => {
    try {
      const { email, password } = req.body;
      if (!email || !password) {
        return res.status(400).json({
          success: false,
          error: "Debes ingresa un email y una contraseña validos",
        });
      }
      // corroborar la existencia del usuario en los registros
      const user = await User.findOne({ email });
      if (!user) {
        return res
          .status(401)
          .json({ success: false, error: "Datos incorrectos" });
      }

      // validar la contraseña
      const SECRET_KEY = env().SECRET_KEY as string;
      const isValid = await bcrypt.compare(password, user.password);
      if (!isValid) {
        return res
          .status(401)
          .json({ success: false, error: "Datos incorrectos" });
      }
      // ✅ Permiso especial - sesion de uso -> token
      // jsonwebtoken -> jwt

      // jwt.sign:
      // - payload -> informacion publica que quiero compartir del usuario logueado
      // - clave secreta -> firma que valida al token
      // - opciones -> cuando expira
      const token = jwt.sign({ id: user._id }, SECRET_KEY, {
        expiresIn: "1h",
      });
      res.json({ success: true, token });
    } catch (error) {
      const e = error as Error;
      res.status(500).json({ success: false, error: e.message });
    }
  };
}

export { AuthController };
