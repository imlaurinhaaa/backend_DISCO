const express = require("express");
const router = express.Router();
const userController = require("../controllers/userController");
const multer = require('multer');
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

router.get("/users", userController.getUsers);
router.get("/users/:id", userController.getUserById);
router.post("/users/create", userController.createUser);
router.put("/users/:id", upload.single("photo"), userController.updateUser);
router.delete("/users/:id", userController.deleteUser);
router.post("/register", upload.single("photo"), userController.registerUser);
router.post("/user/login", userController.loginUser);

module.exports = router;