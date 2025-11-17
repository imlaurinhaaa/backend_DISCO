const singerModel = require("../models/singerModel");

const getSingers = async (req, res) => {
    try {
        const { name } = req.query;
        const singers = await singerModel.getSingers(name);
        res.status(200).json({ message: "Cantores encontrados com sucesso", singers });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: `Erro ao buscar cantores: ${error.message}` });
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

module.exports = { getSingers, getSingerById, createSinger, updateSinger, deleteSinger };