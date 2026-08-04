import nodemailer from "nodemailer";

const USER = process.env.EMAIL_USER;
const PASS = process.env.EMAIL_PASS;

const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: USER,
    pass: PASS,
  },
  tls: {
    rejectUnauthorized: false,
  },
});

export { transporter };

// import nodemailer from "nodemailer";

// const USER = process.env.EMAIL_USER;
// const PASS = process.env.EMAIL_PASS;

// const transporter = nodemailer.createTransport({
//   host: "smtp.gmail.com",
//   port: 587,
//   secure: false,
//   auth: {
//     user: USER,
//     pass: PASS,
//   },
//   tls: {
//     rejectUnauthorized: false,
//   },
// });

// export { transporter };
