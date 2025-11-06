const pool = require("../config/database");

// Função para buscar playlists pelo nome 
const getPlaylists = async (title, user_id) => {
    let query = "SELECT playlists.* FROM playlists";
    let conditions = [];
    let params = [];

    // Adiciona condições de busca se o título for fornecido
    if (title && title.trim()) {

        params.push(`%${title.trim()}%`);
        conditions.push(`playlists.title ILIKE $${params.length}`);
    }
    // Adiciona condição de busca se o user_id for fornecido
    if (user_id && user_id.trim()) {
        params.push(user_id.trim());
        conditions.push(`playlists.user_id = $${params.length}`);
    }

    if (conditions.length > 0) {
        query += " WHERE " + conditions.join(" AND ");
    }

    try {
        // Executa a consulta no banco de dados
        const result = await pool.query(query, params);
        return result.rows;
    } catch (error) {
        throw new Error(`Erro ao buscar playlists: ${error.message}`);
    }
};


// Função para buscar um favorito pelo ID
const getPlaylistById = async (id) => {
    try {
        const result = await pool.query("SELECT * FROM playlists WHERE id = $1", [id]);
        if (result.rows.length === 0) {
            throw new Error("Playlist não encontrada.");
        }
        return result.rows[0];
    } catch (error) {
        throw new Error(`Erro ao buscar playlist pelo ID: ${error.message}`);
    }
};


// Função para criar um novo favorito
const createPlaylist = async (user_id, title, photo, description) => {
    try {
        const result = await pool.query(
            "INSERT INTO playlists (user_id, title, photo, description) VALUES ($1, $2, $3, $4) RETURNING *",
            [user_id, title, photo, description]
        );
        return result.rows[0];
    } catch (error) {
        console.error(error);
        throw new Error(`Erro ao criar playlist: ${error.message}`);
    }
};


// Função para atualizar os dados de um favorito
const updatePlaylist = async (id, user_id, title, photo, description) => {
    try {
        // Verifica se a playlist existe
        const currentPlaylist = await pool.query("SELECT * FROM playlists WHERE id = $1", [id]);
        if (!currentPlaylist.rows[0]) {
            throw new Error("Playlist não encontrada para atualização.");
        }

        // Atualiza os campos com os valores fornecidos ou mantém os valores atuais
        const updatedUserId = (user_id !== undefined) ? user_id : currentPlaylist.rows[0].user_id;
        const updatedTitle = (title !== undefined) ? title : currentPlaylist.rows[0].title;
        const updatedPhoto = (photo !== undefined) ? photo : currentPlaylist.rows[0].photo;
        const updatedDescription = (description !== undefined) ? description : currentPlaylist.rows[0].description;

        // Executa a atualização no banco de dados
        const result = await pool.query(
            "UPDATE playlists SET user_id = $1, title = $2, photo = $3, description = $4 WHERE id = $5 RETURNING *",
            [updatedUserId, updatedTitle, updatedPhoto, updatedDescription, id]
        );
        return result.rows[0];
    } catch (error) {
        throw new Error(`Erro ao atualizar playlist: ${error.message}`);
    }
};

// Função para deletar um favorito
const deletePlaylist = async (req, res) => {
    try {
        const deletedPlaylist = await pool.query("DELETE FROM playlists WHERE id = $1 RETURNING *", [req.params.id]);
        if (!deletedPlaylist.rows[0]) {
            return res.status(404).json({ message: "Playlist não encontrada para exclusão." });
        }
        res.status(200).json({ message: "Playlist deletada com sucesso.", details: deletedPlaylist.rows[0] });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: `Erro ao deletar playlist: ${error.message}` });
    }
};

module.exports = {
    getPlaylists,
    getPlaylistById,
    createPlaylist,
    updatePlaylist,
    deletePlaylist
};
