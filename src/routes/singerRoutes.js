const express = require("express");
const router = express.Router();
const singerController = require("../controllers/singerController");
const upload = require("./../config/upload.js");

router.get("/singers", singerController.getSingers);
router.get("/genres", singerController.getGenresController);
router.get("/singers/:id", singerController.getSingerById);
router.post("/singers", upload.single("photo"), singerController.createSinger);
router.put("/singers/:id", upload.single("photo"), singerController.updateSinger);
router.delete("/singers/:id", singerController.deleteSinger);

module.exports = router;