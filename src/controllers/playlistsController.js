const playlistsModel = require("../models/playlistsModel");

const getPlaylistsByTitleAndUser = async (req, res) => {
    try {
        const { title, user_id } = req.params;

        // Valida se o título foi fornecido
        if (!title || title.trim() === "") {
            return res.status(400).json({ message: "O título da playlist é obrigatório." });
        }

        // Valida se o user_id foi fornecido
        if (!user_id || isNaN(user_id)) {
            return res.status(400).json({ message: "O ID do usuário é obrigatório e deve ser um número válido." });
        }

        // Busca as playlists do usuário
        const playlists = await playlistsModel.getPlaylists(title, user_id);

        if (playlists.length === 0) {
            return res.status(404).json({ message: "Nenhuma playlist encontrada para os critérios fornecidos." });
        }

        // Retorna a resposta com as playlists encontradas
        res.status(200).json({ 
            message: "Playlists encontradas com sucesso.", 
            count: playlists.length, 
            playlists 
        });
    } catch (error) {
        console.error(`Erro ao buscar playlists: ${error.message}`);
        res.status(500).json({ message: `Erro ao encontrar playlists: ${error.message}` });
    }
};

// Rota para buscar uma playlist pelo ID
const getPlaylistById = async (req, res) => {
    try {
        const playlist = await playlistsModel.getPlaylistById(req.params.id);
        if (!playlist) {
            return res.status(404).json({ message: "Playlist não encontrada." });
        }
        res.status(200).json({ message: "Playlist encontrada com sucesso.", playlist });
    } catch (error) {
        console.error(`Erro ao buscar playlist: ${error.message}`);
        res.status(404).json({ message: `Erro ao encontrar playlist: ${error.message}` });
    }
};

// Rota para criar um novo favorito
const createPlaylist = async (req, res) => {
    try {
        const { user_id, title, description } = req.body;

        // Valida os campos obrigatórios
        if (!user_id || !title) {
            return res.status(400).json({ message: "Os campos 'user_id' e 'title' são obrigatórios." });
        }

        const photo = req.file ? req.file.filename : null;
        const newPlaylist = await playlistsModel.createPlaylist(user_id, title, photo, description);
        return res.status(201).json({ message: "Playlist criada com sucesso.", newPlaylist });
    } catch (error) {
        console.error(`Erro ao criar playlist: ${error.message}`);
        return res.status(500).json({ message: `Erro ao criar playlist: ${error.message}` });
    }
};


// Rota para atualizar os dados de uma playlist
const updatePlaylist = async (req, res) => {
    try {
        const { user_id, title, description } = req.body;
        const photo = req.file ? req.file.filename : null;
        const updatedPlaylist = await playlistsModel.updatePlaylist(req.params.id, user_id, title, photo, description);

        if (!updatedPlaylist) {
            return res.status(404).json({ message: "Playlist não encontrada para atualização." });
        }
        res.status(200).json({ message: "Playlist atualizada com sucesso.", updatedPlaylist });
    } catch (error) {
        console.error(`Erro ao atualizar playlist: ${error.message}`);
        res.status(500).json({ message: `Erro ao atualizar playlist: ${error.message}` });
    }
};

// Rota para deletar uma playlist
const deletePlaylist = async (req, res) => {
    try {
        const deletedPlaylist = await playlistsModel.deletePlaylist(req.params.id);
        if (!deletedPlaylist) {
            return res.status(404).json({ message: "Playlist não encontrada para exclusão." });
        }
        res.status(200).json({ message: "Playlist deletada com sucesso.", details: deletedPlaylist });
    } catch (error) {
        console.error(`Erro ao deletar playlist: ${error.message}`);
        res.status(500).json({ message: `Erro ao deletar playlist: ${error.message}` });
    }
};

module.exports = { 
    getPlaylistsByTitleAndUser, 
    getPlaylistById, 
    createPlaylist, 
    updatePlaylist, 
    deletePlaylist 
};