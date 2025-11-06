require("dotenv").config();
const express = require("express");  
const cors = require("cors");
const singerRoutes = require("./src/routes/singerRoutes");
const cors = require("cors");  
const favoritesRoutes = require("./src/routes/favoritesRoutes");
const albumRoutes = require("./src/routes/albumRoutes");

const app = express();  
app.use(cors()); 
app.use(express.json());

app.use("/api", singerRoutes);
app.use("/api", albumRoutes);
app.use("/api", favoritesRoutes);

const PORT = process.env.PORT || 4000;  

app.listen(PORT, () => {  
    console.log(`DISCO! 💽 http://localhost:${PORT}`);  
});