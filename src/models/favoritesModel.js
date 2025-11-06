const pool = require("../config/database");

// Função para buscar favoritos pelo ID do usuário
const getFavorites = async (user_id) => {
    let query = `SELECT 
        favorites.id AS favorite_id, 
        singers.name AS singer_name, 
        albums.title AS album_title 
    FROM favorites
    LEFT JOIN singers ON favorites.singer_id = singers.id
    LEFT JOIN albums ON favorites.album_id = albums.id
    LEFT JOIN songs ON favorites.songs_id = songs.id
    WHERE favorites.user_id = $1`;
    const conditions = [];
    const params = [];

    try {
        // Busca o nome do usuário antes de executar a consulta principal
        const userQuery = "SELECT name FROM users WHERE id = $1";
        const userResult = await pool.query(userQuery, [user_id]);

        if (userResult.rows.length === 0) {
            throw new Error(`Usuário com ID ${user_id} não encontrado.`);
        }

        const userName = userResult.rows[0].name;

        // Adiciona condições de busca se o ID do usuário for fornecido
        if (user_id && user_id.trim()) {
            params.push(`%${user_id.trim()}%`);
            conditions.push(`users.id ILIKE $${params.length}`);
        }
        if (conditions.length > 0) {
            query += " WHERE " + conditions.join(" AND ");
        }

        // Executa a consulta no banco de dados
        const result = await pool.query(query, params);
        return result.rows;
    } catch (error) {
        throw new Error(`Erro ao buscar favoritos do usuário ${user_id}: ${error.message}`);
    }
};

// Função para buscar um favorito pelo ID
const getFavoriteById = async (id) => {
    try {
        const result = await pool.query("SELECT * FROM favorites WHERE id = $1", [id]);
        if (result.rows.length === 0) {
            throw new Error("Favorito não encontrado.");
        }
        return result.rows[0];
    } catch (error) {
        throw new Error(`Erro ao buscar favorito pelo ID: ${error.message}`);
    }
};

// Função para criar um novo favorito
const createFavorite = async (user_id, singer_id, album_id, song_id) => {
    try {
        const result = await pool.query(
            "INSERT INTO favorites (user_id, singer_id, album_id, song_id) VALUES ($1, $2, $3, $4) RETURNING *",
            [user_id, singer_id, album_id, song_id]
        );
        return result.rows[0];
    } catch (error) {
        if (error.code === "23505" && error.constraint === "favorites_user_id_singer_id_album_id_song_id_key") {
            throw new Error("Erro: O favorito fornecido já está registrado.");
        }
        throw new Error(`Erro ao criar favorito: ${error.message}`);
    }
};

// Função para atualizar os dados de um favorito
const updateFavorite = async (id, user_id, singer_id, album_id, song_id) => {
    try {
        // Verifica se o favorito existe
        const currentFavorite = await pool.query("SELECT * FROM favorites WHERE id = $1", [id]);
        if (!currentFavorite.rows[0]) {
            throw new Error("Favorito não encontrado para atualização.");
        }

        // Atualiza os campos com os valores fornecidos ou mantém os valores atuais
        const updatedUserId = (user_id !== undefined) ? user_id : currentFavorite.rows[0].user_id;
        const updatedSingerId = (singer_id !== undefined) ? singer_id : currentFavorite.rows[0].singer_id;
        const updatedAlbumId = (album_id !== undefined) ? album_id : currentFavorite.rows[0].album_id;
        const updatedSongId = (song_id !== undefined) ? song_id : currentFavorite.rows[0].song_id;

        // Executa a atualização no banco de dados
        const result = await pool.query(
            "UPDATE favorites SET user_id = $1, singer_id = $2, album_id = $3, song_id = $4 WHERE id = $5 RETURNING *",
            [updatedUserId, updatedSingerId, updatedAlbumId, updatedSongId, id]
        );
        return result.rows[0];
    } catch (error) {
        throw new Error(`Erro ao atualizar favorito: ${error.message}`);
    }
};

// Função para deletar um favorito
const deleteFavorite = async (req, res) => {
    try {
        const deletedFavorite = await pool.query("DELETE FROM favorites WHERE id = $1 RETURNING *", [req.params.id]);
        if (!deletedFavorite.rows[0]) {
            return res.status(404).json({ message: "Favorito não encontrado para exclusão." });
        }
        res.status(200).json({ message: "Favorito deletado com sucesso.", details: deletedFavorite.rows[0] });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: `Erro ao deletar favorito: ${error.message}` });
    }
};

// Função para alternar o estado de um favorito (adicionar/remover)
const toggleFavorite = async (user_id, singer_id, album_id, song_id) => {
    try {
        // Verifica se o favorito já existe
        const existingFavorite = await pool.query(
            "SELECT * FROM favorites WHERE user_id = $1 AND singer_id = $2 AND album_id = $3 AND song_id = $4",
            [user_id, singer_id, album_id, song_id]
        );

        if (existingFavorite.rows.length > 0) {
            // Se já existe, desfavorita (remove o registro)
            await pool.query(
                "DELETE FROM favorites WHERE user_id = $1 AND singer_id = $2 AND album_id = $3 AND song_id = $4",
                [user_id, singer_id, album_id, song_id]
            );
            return { message: "Favorito removido com sucesso." };
        } else {
            // Caso contrário, adiciona como favorito
            const newFavorite = await pool.query(
                "INSERT INTO favorites (user_id, singer_id, album_id, song_id) VALUES ($1, $2, $3, $4) RETURNING *",
                [user_id, singer_id, album_id, song_id]
            );
            return { message: "Favorito adicionado com sucesso.", favorite: newFavorite.rows[0] };
        }
    } catch (error) {
        throw new Error(`Erro ao alternar favorito: ${error.message}`);
    }
};

module.exports = { getFavorites, getFavoriteById, createFavorite, updateFavorite, deleteFavorite, toggleFavorite };