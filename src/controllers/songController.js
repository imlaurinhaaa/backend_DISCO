const songModel = require("../models/songModel");

const getSongs = async (req, res) => {
    try {
        const { title } = req.query;
        const songs = await songModel.getSongs(title);
        res.status(200).json({ message: "Músicas encontradas com sucesso", songs });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: `Erro ao buscar músicas: ${error.message}` });
    }
};

const getSongById = async (req, res) => {
    try {
        const song = await songModel.getSongById(req.params.id);
        res.status(200).json({ message: "Música encontrada com sucesso", song });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: `Erro ao buscar música por ID: ${error.message}` });
    }
};

const createSong = async (req, res) => {
    try {
        const { title, description, singer_id, album_id, duration, lyrics } = req.body;

        if (!title || !description || !singer_id || !album_id || !duration || !lyrics) {
            return res.status(400).json({ message: "Todos os campos são obrigatórios." });
        }

        const newSong = await songModel.createSong(title, description, singer_id, album_id, duration, lyrics);
        res.status(201).json({ message: "Música criada com sucesso", song: newSong });
    } catch (error) {
        console.error(error);

        if (error.message.includes("Já existe uma música com esse título.")) {
            return res.status(400).json({ message: error.message });
        }

        res.status(500).json({ message: `Erro ao criar música: ${error.message}` });
    }
};

const updateSong = async (req, res) => {
    try {
        const { title, description, singer_id, album_id, duration } =req.body;
        const updatedSong = await songModel.updateSong(req.params.id, title, description, singer_id, album_id, duration);
        res.status(200).json({ message: "Música atualizada com sucesso", song: updatedSong });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: `Erro ao atualizar música: ${error.message}` });
    }
};

const deleteSong = async (req, res) => {
    try {
        const song = await songModel.deleteSong(req.params.id);
        res.status(200).json({ message: "Música deletada com sucesso.", song });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: `Erro ao deletar música: ${error.message}` });
    }
};

module.exports = { getSongs, getSongById, createSong, updateSong, deleteSong };