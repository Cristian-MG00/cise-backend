import { model, Model, Schema } from "mongoose";
import { IUser } from "../interfaces/IUser";

// schema del usuario
const userSchema = new Schema<IUser>(
  {
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true },
  },
  {
    versionKey: false,
  },
);

// modelo del usuario que crea la coleccion en mongodb -> User -> users
const User: Model<IUser> = model("User", userSchema);

export { User };
