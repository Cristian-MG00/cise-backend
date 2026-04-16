import dotenv from "dotenv";
dotenv.config();
// con dotenv.config() accedo a las variables de entorno, esto se hace asi si o si para que funcione en etapa de produccion

const env = () => {
  return {
    PORT: process.env.PORT,
    SECRET_KEY: process.env.SECRET_KEY,
    URI_DB: process.env.URI_DB,
  };
};

export { env };
