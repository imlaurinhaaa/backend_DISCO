const express = require("express");
const router = express.Router();
const playlistsController = require("../controllers/playlistsController");
const multer = require('multer');
const upload = multer({ dest: "uploads/" });

router.get("/playlists", playlistsController.getPlaylistsByTitleAndUser);
router.get("/playlists/:id", playlistsController.getPlaylistById);
router.post("/playlists", upload.single("photo"), playlistsController.createPlaylist);
router.put("/playlists/:id", upload.single("photo"), playlistsController.updatePlaylist);
router.delete("/playlists/:id", playlistsController.deletePlaylist);

module.exports = router;