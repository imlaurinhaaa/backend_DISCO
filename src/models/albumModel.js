const pool = require("../config/database");

const getAlbums = async (title) => {
    let query = "SELECT albums.* FROM albums";
    let conditions = [];
    let params = [];

    if (title && title.trim()) {
        params.push(`%${title.trim()}%`);
        conditions.push(`albums.title ILIKE $${params.length}`);
    }

    if (conditions.length > 0) {
        query += " WHERE " + conditions.join(" AND ");
    }

    try {
        const result = await pool.query(query, params);
        return result.rows;
    } catch (error) {
        throw new Error(`Erro ao buscar álbuns: ${error.message}`);
    }
};

const getAlbumById = async (id) => {
    try {
        const result = await pool.query("SELECT * FROM albums WHERE id = $1", [id]);
        if (result.rows.length === 0) {
            throw new Error("Álbum não encontrado");
        }
        return result.rows[0];
    } catch (error) {
        throw new Error(`Erro ao buscar álbum por ID: ${error.message}`);
    }
};

const createAlbum = async (title, singer_id, release_year, duration, num_of_tracks, photo_cover, photo_disk) => {
    try {
        const result = await pool.query(
            "INSERT INTO albums (title, singer_id, release_year, duration, num_of_tracks, photo_cover, photo_disk) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *",
            [title, singer_id, release_year, duration, num_of_tracks, photo_cover, photo_disk]
        );
        return result.rows[0];
    } catch (error) {
        console.error(error);
        throw new Error(`Erro ao criar álbum: ${error.message}`);
    }
};

const updateAlbum = async (id, title, singer_id, release_year, duration, num_of_tracks, photo_cover, photo_disk) => {
    try {
        const currentAlbum = await pool.query("SELECT * FROM albums WHERE id = $1", [id]);
        if (!currentAlbum.rows[0]) {
            throw new Error("Álbum não encontrado para atualização.");
        }

        const updateTitle = (title !== undefined) ? title : currentAlbum.rows[0].title;
        const updateSingerId = (singer_id !== undefined) ? singer_id : currentAlbum.rows[0].singer_id;
        const updateReleaseYear = (release_year !== undefined) ? release_year : currentAlbum.rows[0].release_year;
        const updateDuration = (duration !== undefined) ? duration : currentAlbum.rows[0].duration;
        const updateNumOfTracks = (num_of_tracks !== undefined) ? num_of_tracks : currentAlbum.rows[0].num_of_tracks;
        const updatePhotoCover = (photo_cover !== undefined) ? photo_cover : currentAlbum.rows[0].photo_cover;
        const updatePhotoDisk = (photo_disk !== undefined) ? photo_disk : currentAlbum.rows[0].photo_disk;

        const result = await pool.query(
            "UPDATE albums SET title = $1, singer_id = $2, release_year = $3, duration = $4, num_of_tracks = $5, photo_cover = $6, photo_disk = $7 WHERE id = $8 RETURNING *",
            [updateTitle, updateSingerId, updateReleaseYear, updateDuration, updateNumOfTracks, updatePhotoCover, updatePhotoDisk, id]
        );
        return result.rows[0];
    } catch (error) {
        throw new Error(`Erro ao atualizar álbum: ${error.message}`);
    }
};

const deleteAlbum = async (id) => {
    try {
        const deleteAlbum = await pool.query("DELETE FROM albums WHERE id = $1 RETURNING *", [id]);
        if (!deleteAlbum.rows[0]) {
            return res.status(404).json({ message: "Álbum não encontrado para deletar." });
        }
        return res.status(200).json({ message: "Álbum deletado com sucesso." });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: `Erro ao deletar álbum: ${error.message}` });
    }
};

module.exports = { getAlbums, getAlbumById, createAlbum, updateAlbum, deleteAlbum };