require("dotenv").config();
const express = require("express");  
const cors = require("cors");  
const favoritesRoutes = require("./src/routes/favoritesRoutes");
const playlistsRoutes = require("./src/routes/playlistsRoutes");

const app = express();  
app.use(cors()); 
app.use(express.json());

app.use("/favorites", favoritesRoutes);
app.use("/api", playlistsRoutes);

const PORT = process.env.PORT || 4000;  

app.listen(PORT, () => {  
    console.log(`DISCO! 💽 http://localhost:${PORT}`);  
});