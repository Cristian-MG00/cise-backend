import multer, { Multer } from "multer";
import path from "node:path";

// storage = ALMACENAMIENTO
const storage = multer.diskStorage({
  // guardar el archivo en la carpeta uploads
  destination: (req, file, cb) => {
    cb(null, "uploads/");
  },
  // como se va a llamar el archivo
  filename: (req, file, cb) => {
    const name = Date.now() + "-" + crypto.randomUUID();
    cb(null, name + path.extname(file.originalname));
  },
});

// FILTRO ARCHIVOS QUE RECIBO DEL FRONT(analizis del tipo de archivo)
const fileFilter = (
  req: Express.Request,
  file: Express.Multer.File,
  cb: multer.FileFilterCallback,
) => {
  console.log("Hola desde el fileFilter");
  if (file.mimetype.startsWith("image/")) {
    cb(null, true);
  } else {
    console.log(file.mimetype);
    cb(new Error("Solo se permiten imágenes"));
  }
};

const upload = multer({ storage, fileFilter });

export { upload };
