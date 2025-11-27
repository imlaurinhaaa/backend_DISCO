const express = require("express");
const router = express.Router();
const songRoutes = require("../controllers/songController");

router.get("/songs", songRoutes.getSongs);
router.get("/songs/singer", songRoutes.getSongsBySingerNameController);
router.get("/songs/:id", songRoutes.getSongById);
router.post("/songs", songRoutes.createSong);
router.put("/songs/:id", songRoutes.updateSong);
router.delete("/songs/:id", songRoutes.deleteSong);

module.exports = router;