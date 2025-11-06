const express = require('express');
const router = express.Router();
const albumController = require("../controllers/albumController");

router.get("/albums", albumController.getAlbums);
router.get("/albums/:id", albumController.getAlbumById);
router.post("/albums", albumController.createAlbum);
router.put("/albums/:id", albumController.updateAlbum);
router.delete("/albums/:id", albumController.deleteAlbum);

module.exports = router;