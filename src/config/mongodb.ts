import { connect } from "mongoose";
import { env } from "./env";

// funcion que conecta a la db
const connectDB = async () => {
  const URI_DB = env().URI_DB as string;

  try {
    await connect(URI_DB);
    console.log("✅ Conectado a Mongo DB");
  } catch (error) {
    console.log("uridb ->", URI_DB);
    console.log("❌ No se pudo conectar a Mongo DB");
    process.exit(1);
  }
};

export { connectDB };
