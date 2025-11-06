require("dotenv").config();
const express = require("express");  
const cors = require("cors");  
const favoritesRoutes = require("./src/routes/favoritesRoutes");

const app = express();  
app.use(cors()); 
app.use(express.json());

app.use("/favorites", favoritesRoutes);

const PORT = process.env.PORT || 4000;  

app.listen(PORT, () => {  
    console.log(`DISCO! 💽 http://localhost:${PORT}`);  
});