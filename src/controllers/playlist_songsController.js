const playlistSongsModels = require('../models/playlist_songsModels');

const getPlaylistSongs = async (req, res) => {
    try {
        const { playlist_id } = req.params;

        // Valida se o playlist_id foi fornecido
        if (!playlist_id || isNaN(playlist_id)) {
            return res.status(400).json({ message: "O ID da playlist é obrigatório e deve ser um número." });
        }

        // Busca as músicas da playlist
        const songs = await playlistSongsModels.getPlaylistSongs(playlist_id);

        // Retorna a resposta com as músicas encontradas
        res.status(200).json({ 
            message: "Músicas da playlist encontradas com sucesso.", 
            count: songs.length, 
            songs 
        });
    } catch (error) {
        console.error(`Erro ao buscar músicas da playlist: ${error.message}`);
        res.status(500).json({ message: `Erro ao encontrar músicas da playlist: ${error.message}` });
    }
};

// Rota para buscar uma música da playlist pelo ID
const getPlaylistSongsById = async (req, res) => {
    try {
        const song = await playlistSongsModels.getPlaylistSongsById(req.params.id);
        if (!song) {
            return res.status(404).json({ message: "Música da playlist não encontrada." });
        }
        res.status(200).json({ message: "Música da playlist encontrada com sucesso.", song });
    } catch (error) {
        console.error(`Erro ao buscar música da playlist: ${error.message}`);
        res.status(404).json({ message: `Erro ao encontrar música da playlist: ${error.message}` });
    }
};


// Rota para criar um novo favorito
const createPlaylistSongs = async (req, res) => {
    try {
        const { playlist_id, song_id } = req.body;

        // Valida os campos obrigatórios
        if (!playlist_id || !song_id) {
            return res.status(400).json({ message: "Os campos 'playlist_id' e 'song_id' são obrigatórios." });
        }

        const newPlaylistSong = await playlistSongsModels.createPlaylistSong(playlist_id, song_id);
        return res.status(201).json({ message: "Música adicionada à playlist com sucesso.", newPlaylistSong });
    } catch (error) {
        console.error(`Erro ao adicionar música à playlist: ${error.message}`);
        return res.status(500).json({ message: `Erro ao adicionar música à playlist: ${error.message}` });
    }
};

// Rota para atualizar a música de uma playlist
const updatePlaylistSongs = async (req, res) => {
    try {
        const { playlist_id, song_id } = req.body;
        const updatedPlaylistSong = await playlistSongsModels.updatePlaylistSong(req.params.id, playlist_id, song_id);

        if (!updatedPlaylistSong) {
            return res.status(404).json({ message: "Música da playlist não encontrada para atualização." });
        }
        res.status(200).json({ message: "Música da playlist atualizada com sucesso.", updatedPlaylistSong });
    } catch (error) {
        console.error(`Erro ao atualizar música da playlist: ${error.message}`);
        res.status(500).json({ message: `Erro ao atualizar música da playlist: ${error.message}` });
    }
};

// Rota para deletar uma música de uma playlist
const deletePlaylistSong = async (req, res) => {
    try {
        const deletedPlaylistSong = await playlistSongsModels.deletePlaylistSong(req.params.id);
        if (!deletedPlaylistSong) {
            return res.status(404).json({ message: "Música da playlist não encontrada para exclusão." });
        }
        res.status(200).json({ message: "Música da playlist deletada com sucesso.", details: deletedPlaylistSong });
    } catch (error) {
        console.error(`Erro ao deletar música da playlist: ${error.message}`);
        res.status(500).json({ message: `Erro ao deletar música da playlist: ${error.message}` });
    }
};

module.exports = {
    getPlaylistSongs,
    getPlaylistSongsById,
    createPlaylistSongs,
    updatePlaylistSongs,
    deletePlaylistSong
};  