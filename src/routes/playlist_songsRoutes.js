const express = require("express");
const router = express.Router();
const playlist_songsController = require("../controllers/playlist_songsController");

router.get("/playlists/:playlist_id/songs", playlist_songsController.getPlaylistSongs);
router.get("/playlists/songs/:id", playlist_songsController.getPlaylistSongsById);
router.post("/playlists/:playlist_id/songs", playlist_songsController.createPlaylistSongs);
router.put("/playlists/songs/:id", playlist_songsController.updatePlaylistSongs);
router.delete("/playlists/songs/:id", playlist_songsController.deletePlaylistSong);

module.exports = router;