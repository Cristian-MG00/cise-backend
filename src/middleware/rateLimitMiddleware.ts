import rateLimit from "express-rate-limit";

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 5,
  handler: (req, res, next, options) => {
    res.status(429).json({
      success: false,
      error: `Alcanzaste el limite de ${options.max} intentos cada ${options.windowMs / 1000 / 60} minutos `,
    });
  },
});

export { limiter };
