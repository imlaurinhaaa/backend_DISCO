const pool = require("../config/database");

// Função para buscar músicas de uma playlist

const getPlaylistSongs = async (playlist_id) => {
    let query = `
        SELECT songs.* 
        FROM songs 
        JOIN playlist_songs ON songs.id = playlist_songs.song_id
    `;
    let conditions = [];
    let params = [];

    // Adiciona condição de busca se o playlist_id for fornecido
    if (playlist_id) {
        params.push(playlist_id);
        conditions.push(`playlist_songs.playlist_id = $${params.length}`);
    }

    if (conditions.length > 0) {
        query += " WHERE " + conditions.join(" AND ");
    }

    try {
        // Executa a consulta no banco de dados
        const result = await pool.query(query, params);
        return result.rows || []; // Retorna um array vazio se não houver resultados
    } catch (error) {
        console.error("Erro ao buscar músicas da playlist:", error);
        throw new Error(`Erro ao buscar playlists: ${error.message}`);
    }
};


// Função para buscar um favorito pelo ID
const getPlaylistSongsById = async (id) => {
    try {
        const result = await pool.query("SELECT * FROM playlist_songs WHERE id = $1", [id]);
        if (result.rows.length === 0) {
            throw new Error("Música da playlist não encontrada.");
        }
        return result.rows[0];
    } catch (error) {
        throw new Error(`Erro ao buscar música da playlist pelo ID: ${error.message}`);
    }
};

// Função para criar um novo favorito
const createPlaylistSong = async (playlist_id, song_id) => {
    try {
        const result = await pool.query(
            "INSERT INTO playlist_songs (playlist_id, song_id) VALUES ($1, $2) RETURNING *",
            [playlist_id, song_id]
        );
        return result.rows[0];
    } catch (error) {
        console.error(error);
        throw new Error(`Erro ao adicionar música na playlist: ${error.message}`);
    }
};

// Função para atualizar os dados de um favorito
const updatePlaylistSong = async (id, playlist_id, song_id) => {
    try {
        // Verifica se a música da playlist existe
        const currentPlaylistSong = await pool.query("SELECT * FROM playlist_songs WHERE id = $1", [id]);
        if (!currentPlaylistSong.rows[0]) {
            throw new Error("Música da playlist não encontrada para atualização.");
        }

        // Atualiza os campos com os valores fornecidos ou mantém os valores atuais
        const updatedPlaylistId = (playlist_id !== undefined) ? playlist_id : currentPlaylistSong.rows[0].playlist_id;
        const updatedSongId = (song_id !== undefined) ? song_id : currentPlaylistSong.rows[0].song_id;

        // Executa a atualização no banco de dados
        const result = await pool.query(
            "UPDATE playlist_songs SET playlist_id = $1, song_id = $2 WHERE id = $3 RETURNING *",
            [updatedPlaylistId, updatedSongId, id]
        );
        return result.rows[0];
    } catch (error) {
        throw new Error(`Erro ao atualizar música da playlist: ${error.message}`);
    }
};


// Função para deletar um favorito
const deletePlaylistSong = async (req, res) => {
    try {
        const deletedPlaylistSong = await pool.query("DELETE FROM playlist_songs WHERE id = $1 RETURNING *", [req.params.id]);
        if (!deletedPlaylistSong.rows[0]) {
            return res.status(404).json({ message: "Música da playlist não encontrada para exclusão." });
        }
        res.status(200).json({ message: "Música da playlist deletada com sucesso.", details: deletedPlaylistSong.rows[0] });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: `Erro ao deletar música da playlist: ${error.message}` });
    }
};

module.exports = { getPlaylistSongs, getPlaylistSongsById, createPlaylistSong, updatePlaylistSong, deletePlaylistSong };