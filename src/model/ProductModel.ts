import { model, Model, Schema } from "mongoose";
import { IProduct } from "../interfaces/IProduct";

// creo un schema para mongodb, basado en la interface
const productSchema = new Schema<IProduct>(
  {
    name: { type: String, required: true, unique: true },
    price: { type: Number, required: true },
    category: { type: String, required: true, min: 0 },
    stock: { type: Number, required: true, min: 0 },
  },
  {
    versionKey: false,
  },
);
// modelo que crea la coleccion en mongodb -> Product -> products
const Product: Model<IProduct> = model("Product", productSchema);

export { Product };
