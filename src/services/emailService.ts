import { Request, Response } from "express";
import { transporter } from "../config/emailConfig";
import { createTemplate } from "../templates/emailTemplate";

const emailService = async (req: Request, res: Response) => {
  const { subject, email, message } = req.body;
  if (!subject || !email || !message) {
    res
      .status(400)
      .json({ success: false, error: "Debes llenar todos los campos" });
    return;
  }

  // validaciones

  try {
    const info = await transporter.sendMail({
      from: `Mensaje para Cise limpieza y perfumeria de: ${email}`,
      to: process.env.EMAIL_USER,
      subject,
      html: createTemplate(email, message),
    });
    res.json({
      success: true,
      message: "El correo fue enviado correctamente",
      info,
    });
  } catch (error) {
    const e = error as Error;
    res.status(500).json({ success: false, error: e.message });
  }
  // res.json({ success: true, data: { subject, email, message } });
};

export { emailService };
