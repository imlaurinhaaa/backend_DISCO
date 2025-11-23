const express = require('express');
const router = express.Router();
const albumController = require("../controllers/albumController");
const multer = require("multer");
const path = require("path");

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, path.join(__dirname, "..", "/uploads"));
    },
    filename: (req, file, cb) => {
        cb(null, Date.now() + "-" + file.originalname);
    }
});

const upload = multer({ storage });

router.get("/albums", albumController.getAlbums);
router.get("/albums/:id", albumController.getAlbumById);
router.post("/albums", upload.fields([{ name: "photo_cover", maxCount: 1}, { name: "photo_disk", maxCount: 1}]), albumController.createAlbum);
router.put("/albums/:id", upload.fields([{ name: "photo_cover", maxCount: 1}, { name: "photo_disk", maxCount: 1}]), albumController.updateAlbum);
router.delete("/albums/:id", albumController.deleteAlbum);

module.exports = router;