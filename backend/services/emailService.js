const nodemailer=require("nodemailer")
const dotenv = require('dotenv')
dotenv.config()

const creatVerificationEmailTemplate=(firstname, verificationUrl , action)=>{
    return `
    <!DOCTYPE html>
<html>
<head>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f3f4f6;
      margin: 0;
      padding: 0;
    }
    .email-container {
      max-width: 600px;
      margin: 40px auto;
      background: #ffffff;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0,0,0,0.1);
      overflow: hidden;
    }
    .header {
      background: linear-gradient(to right, #3b82f6, #8b5cf6);
      padding: 20px;
      text-align: center;
      color: white;
    }
    .header h1 {
      margin: 0;
      font-size: 28px;
    }
    .content {
      padding: 40px;
      color: #1f2937;
    }
    .content h2 {
      margin-top: 0;
      font-size: 22px;
    }
    .button {
      display: inline-block;
      padding: 12px 25px;
      margin: 20px 0;
      background: linear-gradient(to right, #3b82f6, #8b5cf6);
      color: white;
      text-decoration: none;
      border-radius: 6px;
      font-weight: bold;
    }
    .footer {
      background: #f3f4f6;
      text-align: center;
      padding: 15px;
      color: #6b7280;
      font-size: 0.85rem;
    }
  </style>
</head>
<body>
  <div class="email-container">
    <div class="header">
      <h1>RealEstateApp</h1>
    </div>
    <div class="content">
      <h2>Welcome, ${firstname}!</h2>
      <p>Thank you for ${action} on RealEstateApp. To start exploring properties, please verify your email address.</p>
      <p style="text-align:center;">
        <a href="${verificationUrl}" class="button">Verify Email</a>
      </p>
      <p>If the button doesn't work, copy and paste this link into your browser:</p>
      <p style="word-break: break-all; color:#3b82f6;">${verificationUrl}</p>
    </div>
    <div class="footer">
      <p>© ${new Date().getFullYear()} RealEstateApp. All rights reserved.</p>
      <p>Your trusted real estate platform</p>
    </div>
  </div>
</body>
</html>
`;
};

//create transporter
const transporter= nodemailer.createTransport({
    host:process.env.SMTP_HOST,
    port:process.env.SMTP_PORT,
    auth:{
        user:process.env.SMTP_USER,
        pass:process.env.SMTP_PASSWORD,
    },
})

//sending verification emaail
const sendVerficationEmail=async(email, name, verificationUrl , action)=>{
    const mailOptions={
        from:`RealStateApp <${process.env.SMTP_USER}>`,
        to: email,
        subject:'welcome to NexaMart - verify your email',
        html: creatVerificationEmailTemplate(name, verificationUrl , action),
    };
    await transporter.sendMail(mailOptions);

};
module.exports = {sendVerficationEmail}; 