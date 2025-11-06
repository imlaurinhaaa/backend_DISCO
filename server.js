require("dotenv").config();
const express = require("express");  
const cors = require("cors");
const singerRoutes = require("./src/routes/singerRoutes");

const app = express();  
app.use(cors()); 
app.use(express.json());

app.use("/api", singerRoutes);

const PORT = process.env.PORT || 4000;  

app.listen(PORT, () => {  
    console.log(`DISCO! 💽 http://localhost:${PORT}`);  
});