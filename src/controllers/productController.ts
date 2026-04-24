import { Request, Response } from "express";
import { Product } from "../model/ProductModel";
import { Types } from "mongoose";
import {
  addProductValidator,
  updateProductValidator,
} from "../validators/productValidator";

class ProductController {
  static getProducts = async (
    req: Request,
    res: Response,
  ): Promise<void | Response> => {
    try {
      const products = await Product.find({});
      res.json({ success: true, data: products });
    } catch (error) {
      const e = error as Error;
      res.status(500).json({ success: false, error: e.name });
    }
  };
  static getProduct = async (
    req: Request,
    res: Response,
  ): Promise<Response | void> => {
    try {
      const { id } = req.params;

      if (!Types.ObjectId.isValid(id as string)) {
        return res.status(400).json({ succes: false, error: "Id invalido" });
      }

      const product = await Product.findById(id);
      if (!product) {
        return res.status(404).json({
          success: false,
          error: "El producto que buscas no se encuentra",
        });
      }

      res.json({ success: true, data: product });
    } catch (error) {
      const e = error as Error;
      return res.status(500).json({ succes: false, error: e.message });
    }
  };
  static addProduct = async (
    req: Request,
    res: Response,
  ): Promise<Response | void> => {
    try {
      const { name, price, category, stock } = req.body;

      if (!name || !price || !category || stock === undefined) {
        return res
          .status(400)
          .json({ success: false, error: "Debes ingresar todos los datos" });
      }

      const product = await Product.findOne({ name });

      if (product) {
        return res
          .status(400)
          .json({ success: false, error: "El producto ya esta en la lista" });
      }

      const validator = addProductValidator.safeParse({
        name,
        price,
        category,
        stock,
      });

      if (!validator.success) {
        return res.status(400).json({
          success: false,
          error: validator.error.issues.map((e) => {
            return {
              propiedad: e.path[0],
              mensaje: e.message,
            };
          }),
        });
      }

      const newProduct = new Product({
        name,
        price,
        category,
        stock,
      });
      await newProduct.save();
      res.status(201).json({ success: true, data: newProduct });
    } catch (error) {
      const e = error as Error;
      res.status(500).json({ success: false, error: e.name });
    }
  };
  static updateProduct = async (
    req: Request,
    res: Response,
  ): Promise<Response | void> => {
    try {
      const { id } = req.params;

      if (!Types.ObjectId.isValid(id as string)) {
        return res.status(400).json({ success: false, error: "Id inválido" });
      }
      const body = req.body;

      const validator = updateProductValidator.safeParse(body);

      if (!validator.success) {
        return res.status(400).json({
          success: false,
          error: validator.error.issues.map((e) => {
            return {
              propiedad: e.path[0],
              mensaje: e.message,
            };
          }),
        });
      }

      const updatedProduct = await Product.findByIdAndUpdate(id, body, {
        new: true,
      });

      if (updatedProduct === null) {
        return res
          .status(404)
          .json({ success: false, error: "El producto no existe en la lista" });
      }

      res.json({ success: true, data: updatedProduct });
    } catch (error) {
      const e = error as Error;
      res.status(500).json({ success: false, error: e.name });
    }
  };
  static deleteProduct = async (
    req: Request,
    res: Response,
  ): Promise<Response | void> => {
    try {
      const id = req.params.id as string;

      if (!Types.ObjectId.isValid(id)) {
        return res.status(400).json({ success: false, error: "Id invalido" });
      }

      const deletedProduct = await Product.findByIdAndDelete(id);

      if (!deletedProduct) {
        return res
          .status(400)
          .json({ success: false, error: "El producto no existe en la lista" });
      }

      res.status(200).json({ success: true, data: deletedProduct });
    } catch (error) {
      const e = error as Error;
      res.status(500).json({ success: false, error: e.name });
    }
  };
}

export { ProductController };
