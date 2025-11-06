const albumModel = require("../models/albumModel");

const getAlbums = async (req, res) => {
    try {
        const { title } = req.query;
        const albums = await albumModel.getAlbums(title);
        res.status(200).json({ message: "Álbuns encontrados com sucesso", albums });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: `Erro ao buscar álbuns: ${error.message}` });
    }
};

const getAlbumById = async (req, res) => {
    try {
        const album = await albumModel.getAlbumById(req.params.id);
        if (!album) {
            return res.status(404).json({ message: "Álbum não encontrado." });
        }
        res.status(200).json({ message: "Álbum encontrado com sucesso", album });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: `Erro ao buscar álbum por ID: ${error.message}` });
    }
};

const  createAlbum = async (req, res) => {
    try {
        const { title, singer_id, release_year, duration, num_of_tracks, photo_cover, photo_disk } = req.body;

        if (!title || !singer_id || !release_year || !duration || !num_of_tracks || !photo_cover || !photo_disk) {
            return res.status(400).json({ message: "Todos os campos são obrigatórios." });
        }

        const newAlbum = await albumModel.createAlbum(title, singer_id, release_year, duration, num_of_tracks, photo_cover, photo_disk);
        res.status(201).json({ message: "Álbum criado com sucesso", album: newAlbum });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: `Erro ao criar álbum: ${error.message}` });
    }
};

const updateAlbum = async (req, res) => {
    try {
        const { title, singer_id, release_year, duration, num_of_tracks, photo_cover, photo_disk } = req.body;
        const updateAlbum = await albumModel.updateAlbum(req.params.id, title, singer_id, release_year, duration, num_of_tracks, photo_cover, photo_disk);

        if (!updateAlbum) {
            return res.status(404).json({ message: "Álbum não encontrado para atualização." });
        }
        res.status(200).json({ message: "Álbum atualizado com sucesso", album: updateAlbum });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: `Erro ao atualizar álbum: ${error.message}` });
    }
};

const deleteAlbum = async (req, res) => {
    try {
        const deleteAlbum = await albumModel.deleteAlbum(req.params.id);
        if (!deleteAlbum) {
            return res.status(404).json({ message: "Álbum não encontrado para deletar." });
        }
        res.status(200).json({ message: "Álbum deletado com sucesso." });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: `Erro ao deletar álbum: ${error.message}` });
    }
};

module.exports = { getAlbums, getAlbumById, createAlbum, updateAlbum, deleteAlbum };