import express, { Request, Response } from "express";
import cors from "cors";
import { connectDB } from "./config/mongodb";
import { productRouter } from "./routes/productRoutes";
// import { authMiddleware } from "./middleware/authMiddleware";
import { authRouter } from "./routes/userRoutes";
import morgan from "morgan";
import logger from "./config/logger";
import { limiter } from "./middleware/rateLimitMiddleware";
import { IUserPayload } from "./interfaces/IUserPayload";
import { env } from "./config/env";

// carga el archivo de las variables de entorno, pero solo funciona para desarrollo
// process.loadEnvFile();

declare global {
  namespace Express {
    interface Request {
      user?: IUserPayload;
    }
  }
}

// busca la variable de entorno llamada PORT en el archivo .env y tambien en los argumentos pasados por la consola, aca usa la herramienta dotenv para acceder a la variable de entorno
// const PORT = process.env.PORT;

const PORT = env().PORT as string;

// creacion del servidor
const app = express();

app.use(cors());
// configuro para que express acepte recibir json
app.use(express.json());
app.use(morgan("dev"));
app.use(logger);

app.use("/auth", limiter, authRouter);
app.use("/products", productRouter);

app.get("/", (req: Request, res: Response): void => {
  res.json({ status: true });
});

app.use((req, res) => {
  res.status(404).json({ success: false, error: "Pagina no encontrada" });
});

app.listen(PORT, () => {
  console.log(`✅ Servidor en escucha en el puerto: http://localhost:${PORT}`);
  connectDB();
});
