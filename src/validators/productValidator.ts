import { z } from "zod";

const productSchemaValidator = z.object({
  name: z
    .string("Ingresa un nombre válido")
    .min(3, "El nombre debe tener un mínimo de 3 caracteres"),
  price: z
    .number("Debes ingresar un número")
    .positive("El precio no puede ser menor a 0"),
  category: z
    .string("Ingresa un nombre válido")
    .min(1, "La categoría debe tener un mínimo de 3 caracteres"),
  stock: z
    .number("Debes ingresar un número")
    .positive("El stock no puede ser menor a 0"),
  image: z.string().default("No contiene imagen"),
});

const addProductValidator = productSchemaValidator;
const updateProductValidator = productSchemaValidator.partial();

export { addProductValidator };
export { updateProductValidator };
