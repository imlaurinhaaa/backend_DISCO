const pool = require('../config/database');

const getSingers = async (name, musical_genre) => {
    let query = "SELECT * FROM singers";
    let conditions = [];
    let params = [];

    if (name && name.trim()) {
        params.push(`%${name.trim()}%`);
        conditions.push(`name ILIKE $${params.length}`);
    }

    if (musical_genre && musical_genre.trim()) {
        params.push(`%${musical_genre.trim()}%`);
        conditions.push(`musical_genre ILIKE $${params.length}`);
    }

    if (conditions.length > 0) {
        query += " WHERE " + conditions.join(" AND ");
    }

    try {
        const result = await pool.query(query, params);
        return result.rows;
    } catch (error) {
        throw new Error(`Erro ao buscar cantores: ${error.message}`);
    }
};

const getSingerById = async (id) => {
    try {
        const result = await pool.query("SELECT * FROM singers WHERE id = $1", [id]);
        if (result.rows.length === 0) {
            throw new Error("Cantor não encontrado");
        }
        return result.rows[0];
    } catch (error) {
        throw new Error(`Erro ao buscar cantor por ID: ${error.message}`);
    }
};

const createSinger = async (photo, name, musical_genre, about, popular_song) => {
    try {
        const result = await pool.query(
            "INSERT INTO singers (photo, name, musical_genre, about, popular_song) VALUES ($1, $2, $3, $4, $5) RETURNING *",
            [photo, name, musical_genre, about, popular_song]
        );
        return result.rows[0];
    } catch (error) {
        if (error.code === "23505") {
            throw new Error("Já existe um cantor com esse nome.");
        }
        throw new Error(`Erro ao criar cantor: ${error.message}`);
    }
};

const updateSinger = async (id, photo, name, musical_genre, about, popular_song) => {
    try {
        const currentSinger = await pool.query("SELECT * FROM singers WHERE id = $1", [id]);
        const singer = currentSinger.rows[0];
        
        if (!singer) {
            throw new Error("Cantor não encontrado para atualização.");
        }

        const updatedPhoto = (photo !== undefined) ? photo : singer.photo;
        const updatedName = (name !== undefined) ? name : singer.name;
        const updatedMusicalGenre = (musical_genre !== undefined) ? musical_genre : singer.musical_genre;
        const updatedAbout = (about !== undefined) ? about : singer.about;
        const updatedPopularSong = (popular_song !== undefined) ? popular_song : singer.popular_song;
        const result = await pool.query(
            "UPDATE singers SET photo = $1, name = $2, musical_genre = $3, about = $4, popular_song = $5 WHERE id = $6 RETURNING *",
            [updatedPhoto, updatedName, updatedMusicalGenre, updatedAbout, updatedPopularSong, id]
        );
        return result.rows[0];
    } catch (error) {
        throw new Error(`Erro ao atualizar cantor: ${error.message}`);
    }
};

const deleteSinger = async (id) => {
    try {
        const deleteSinger = await pool.query("DELETE FROM singers WHERE id = $1 RETURNING *", [id]);
        if (!deleteSinger.rows[0]) {
            throw new Error("Cantor não encontrado para deletar.");
        }
        return deleteSinger.rows[0];
    } catch (error) {
        throw new Error(`Erro ao deletar cantor: ${error.message}`);
    }
};

module.exports = { getSingers, getSingerById, createSinger, updateSinger, deleteSinger };