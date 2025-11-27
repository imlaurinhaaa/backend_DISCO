const pool = require('../config/database');

const getSongs = async (title, musical_genre) => {
    let query = `
        SELECT 
            s.*, 
            sg.name AS singer_name, 
            sg.musical_genre 
        FROM songs s
        JOIN singers sg ON s.singer_id = sg.id
    `;
    let conditions = [];
    let params = [];

    if (musical_genre && musical_genre.trim()) {
        params.push(musical_genre.trim()); 
        conditions.push(`sg.musical_genre = $${params.length}`);
    }
    
    if (title && title.trim()) {
        params.push(`%${title.trim()}%`);
        conditions.push(`s.title ILIKE $${params.length}`);
    }


    if (conditions.length > 0) {
        query += " WHERE " + conditions.join(" AND ");
    }
    
    query += " ORDER BY s.title"; 
    
    console.log("SongModel Query:", query, "Params:", params); // Debug

    try {
        const result = await pool.query(query, params);
        return result.rows;
    } catch (error) {
        throw new Error(`Erro ao buscar músicas: ${error.message}`);
    }
};

const getSongsBySingerName = async (singer_name) => {
    try {
        const result = await pool.query(
            `SELECT s.*
             FROM songs s
             JOIN singers sg ON s.singer_id = sg.id
             WHERE sg.name ILIKE $1`,
            [`%${singer_name}%`] 
        );
        return result.rows;
    } catch (error) {
        throw new Error("Erro ao buscar músicas do cantor: " + error.message);
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

const updateSong = async (id, title, description, singer_id, album_id, duration) => {
    try {
        const currentSong = await pool.query("SELECT * FROM songs WHERE id = $1", [id]);
        const song = currentSong.rows[0];

        if (!song) {
            throw new Error("Música não encontrada para atualização.");
        }

        const updatedTitle = (title !== undefined) ? title : song.title;
        const updatedDescription = (description !== undefined) ? description : song.description;
        const updatedSingerId = (singer_id !== undefined) ? singer_id : song.singer_id;
        const updatedAlbumId = (album_id !== undefined) ? album_id : song.album_id;
        const updatedDuration = (duration !== undefined) ? duration : song.duration;

        const result = await pool.query(
            "UPDATE songs SET title = $1, description = $2, singer_id = $3, album_id = $4, duration = $5 WHERE id = $6 RETURNING *", 
            [updatedTitle, updatedDescription, updatedSingerId, updatedAlbumId, updatedDuration, id]
        );
        return result.rows[0];
    } catch (error) {
        throw new Error(`Erro ao atualizar música: ${error.message}`);
    }
};

const deleteSong = async (id) => {
    try {
        const deletedSong = await pool.query("DELETE FROM songs WHERE id = $1 RETURNING *", [id]);
        if (!deletedSong.rows[0]) {
            throw new Error("Música não encontrada para exclusão.");
        }
        return deletedSong.rows[0];
    } catch (error) {
        throw new Error(`Erro ao deletar música: ${error.message}`);
    }
}

module.exports = { getSongs, getSongsBySingerName, getSongById, createSong, updateSong, deleteSong}