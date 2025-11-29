const pool = require("../config/database");

const getAlbums = async (title) => {
    let query = `
        SELECT 
            a.id, 
            a.title, 
            a.release_year,
            sg.name AS singer_name
        FROM albums a
        JOIN singers sg ON a.singer_id = sg.id
    `;
    let conditions = [];
    let params = [];

    if (title && title.trim()) {
        params.push(`%${title.trim()}%`); 
        conditions.push(`a.title ILIKE $${params.length}`);
    }

    if (conditions.length > 0) {
        query += " WHERE " + conditions.join(" AND ");
    }
    
    query += " ORDER BY a.release_year DESC, a.title ASC"; 

    try {
        const result = await pool.query(query, params);
        return result.rows;
    } catch (error) {
        throw new Error(`Erro ao buscar álbuns no Model: ${error.message}`);
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
        const album = currentAlbum.rows[0];

        if (!album) {
            throw new Error("Álbum não encontrado para atualização.");
        }

        const updatedTitle = (title !== undefined) ? title : album.title;
        const updatedSingerId = (singer_id !== undefined) ? singer_id : album.singer_id;
        const updatedReleaseYear = (release_year !== undefined) ? release_year : album.release_year;
        const updatedDuration = (duration !== undefined) ? duration : album.duration;
        const updatedNumOfTracks = (num_of_tracks !== undefined) ? num_of_tracks : album.num_of_tracks;
        const updatedPhotoCover = (photo_cover !== undefined) ? photo_cover : album.photo_cover;
        const updatedPhotoDisk = (photo_disk !== undefined) ? photo_disk : album.photo_disk;

        const result = await pool.query(
            "UPDATE albums SET title = $1, singer_id = $2, release_year = $3, duration = $4, num_of_tracks = $5, photo_cover = $6, photo_disk = $7 WHERE id = $8 RETURNING *",
            [updatedTitle, updatedSingerId, updatedReleaseYear, updatedDuration, updatedNumOfTracks, updatedPhotoCover, updatedPhotoDisk, id]
        );
        return result.rows[0];
    } catch (error) {
        throw new Error(`Erro ao atualizar álbum: ${error.message}`);
    }
};

const deleteAlbum = async (id) => {
    try {
        const deletedAlbum = await pool.query("DELETE FROM albums WHERE id = $1 RETURNING *", [id]);
        if (!deletedAlbum.rows[0]) {
            throw new Error("Álbum não encontrado para deletar.");
        }
        return deletedAlbum.rows[0];
    } catch (error) {
        throw new Error(`Erro ao deletar álbum: ${error.message}`);
    }       
};

module.exports = { getAlbums, getAlbumById, createAlbum, updateAlbum, deleteAlbum };