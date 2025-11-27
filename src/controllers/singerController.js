const singerModel = require("../models/singerModel");

const getSingers = async (req, res) => {
    try {
        const name = req.query.name || req.query.nome;
        const musical_genre = req.query.musical_genre || req.query.musicalGenre || req.query.genre || req.query.genero;
        const singers = await singerModel.getSingers(name, musical_genre);
        res.status(200).json(singers); 
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: `Erro ao buscar cantores: ${error.message}` });
    }
};

const getGenresController = async (req, res) => {
    try {
        const genres = await singerModel.getGenres();
        res.json(genres);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

const getSingerById = async (req, res) => {
    try {
        const singer = await singerModel.getSingerById(req.params.id);
        res.status(200).json({ message: "Cantor encontrado com sucesso", singer });
    } catch (error) {
        console.error(error);

        if (error.message.includes("Cantor não encontrado")) {
            return res.status(404).json({ message: error.message });
        }

        res.status(500).json({ message: `Erro ao buscar cantor por ID: ${error.message}` });
    }
};

const createSinger = async (req, res) => {
    try {
        const { name, musical_genre, about, popular_song } = req.body;
        const photo = req.file ? req.file.filename : null;

        if (!photo || !name || !musical_genre || !about || !popular_song) {
            return res.status(400).json({ message: "Todos os campos são obrigatórios." });
        }

        const newSinger = await singerModel.createSinger(photo, name, musical_genre, about, popular_song);

        res.status(201).json({ message: "Cantor criado com sucesso", singer: newSinger });
    } catch (error) {
        console.error(error);

        if (error.message.includes("Já existe um cantor com esse nome.")) {
            return res.status(400).json({ message: error.message });
        }

        return res.status(500).json({ message: `Erro ao criar cantor: ${error.message}` });
    }
};

const updateSinger = async (req, res) => {
    try {
        const { name, musical_genre, about, popular_song } = req.body;
        const photo = req.file ? req.file.filename : null;

        const updatedSinger = await singerModel.updateSinger(req.params.id, photo, name, musical_genre, about, popular_song);

        res.status(200).json({ message: "Cantor atualizado com sucesso", singer: updatedSinger });
    } catch (error) {
        console.error(error);

        if (error.message.includes("Cantor não encontrado")) {
            return res.status(404).json({ message: error.message });
        }

        res.status(500).json({ message: `Erro ao atualizar cantor: ${error.message}` });
    }
};

const deleteSinger = async (req, res) => {
    try {
        await singerModel.deleteSinger(req.params.id);
        res.status(200).json({ message: "Cantor excluído com sucesso." });
    } catch (error) {
        console.error(error);

        if (error.message.includes("Cantor não encontrado")) {
            return res.status(404).json({ message: error.message });
        }

        res.status(500).json({ message: `Erro ao deletar cantor: ${error.message}` });
    }
};

module.exports = { getSingers, getGenresController, getSingerById, createSinger, updateSinger, deleteSinger };