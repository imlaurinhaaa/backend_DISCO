const pool = require('../config/database');

const getSongs = async (title) => {
    let query = "SELECT songs.* FROM songs";
    let conditions = [];
    let params = [];

    if (title && title.trim()) {
        params.push(`%${title.trim()}%`);
        conditions.push(`songs.title ILIKE $${params.length}`);
    }

    if (conditions.length > 0) {
        query += " WHERE " + conditions.join(" AND ");
    }

    try {
        const result = await pool.query(query, params);
        return result.rows;
    } catch (error) {
        throw new Error(`Erro ao buscar músicas: ${error.message}`);
    }
};

const getSongById = async (id) => {
    try {
        const result = await pool.query("SELECT * FROM songs WHERE id = $1", [id]);
        if (result.rows.length === 0) {
            throw new Error("Música não encontrada");
        }
        return result.rows[0];
    } catch (error) {
        throw new Error(`Erro ao buscar música por ID: ${error.message}`);
    }
};

const createSong = async (title, description, singer_id, album_id, duration, lyrics) => {
    try {
        const result = await pool.query(
            "INSERT INTO songs (title, description, singer_id, album_id, duration, lyrics) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *",
            [title, description, singer_id, album_id, duration, lyrics]
        );
        return result.rows[0];
    } catch (error) {
        console.error(error);
        throw new Error(`Erro ao criar música: ${error.message}`);
    }
};