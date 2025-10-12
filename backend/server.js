const express = require("express");
const dotenv = require("dotenv");
const cors = require("cors");
const connectDB = require("./config/connectDB");

dotenv.config();

connectDB();

const app = express();
app.use(cors());
app.use(express.json());

//auth router
const authRouter = require("./routers/authRouter");
app.use('/api/auth', authRouter)

//property router
const propertyRouter = require("./routers/propertyRouter");
app.use('/api/property' , propertyRouter);

//chat router
const chatRouter = require('./routers/chatRouter');
app.use('/api/chats' , chatRouter);

//review router
const reviewRouter = require('./routers/reviewRouter');
app.use('api/review/',reviewRouter)

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT} !`));
