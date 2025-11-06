const pool = require('../config/database');

const getSingers = async (name) => {
    let query = "SELECT singers.* FROM singers";
    let conditions = [];
    let params = [];

    if (name && name.trim()) {
        params.push(`%${name.trim()}%`);
        conditions.push(`singers.name ILIKE $${params.length}`);
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
        if (!currentSinger.rows[0]) {
            throw new Error("Cantor não encontrado para atualização.");
        }

        const updatePhoto = (photo !== undefined) ? photo : currentSinger.rows[0].photo;
        const updateName = (name !== undefined) ? name : createSinger.rows[0].name;
        const updateMusicalGenre = (musical_genre !== undefined) ? musical_genre : currentSinger.rows[0].musical_genre;
        const updateAbout = (about !== undefined) ? about : currentSinger.rows[0].about;
        const updatePopularSong = (popular_song !== undefined) ? popular_song : currentSinger.rows[0].popular_song;

        const result = await pool.query(
            "UPDATE singers SET photo = $1, name = $2, musical_genre = $3, about = $4, popular_song = $5 WHERE id = $6 RETURNING *",
            [updatePhoto, updateName, updateMusicalGenre, updateAbout, updatePopularSong, id]
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
            return res.status(404).json({ message: "Cantor não encontrado para deletar." });
        }
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: `Erro ao deletar cantor: ${error.message}` });
    }
};

module.exports = {getSingers, getSingerById, createSinger, updateSinger, deleteSinger};