const express = require("express");
const router = express.Router();
const favoriteController = require("../controllers/favoritesController");

// Rotas para favoritos
router.get("/:user_id", favoriteController.getFavorites);
router.get("/favorite/:id", favoriteController.getFavoriteById);
router.post("/", favoriteController.createFavorite);
router.put("/favorite/:id", favoriteController.updateFavorite);
router.delete("/favorite/:id", favoriteController.deleteFavorite);

module.exports = router;
