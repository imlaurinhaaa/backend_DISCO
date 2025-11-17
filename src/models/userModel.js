const pool = require("../config/database");

const getUsers = async (name) => {
    let query = "SELECT users.* FROM users";
    let conditions = [];
    let params = [];

    if (name && name.trim()) {
        params.push(`%${name.trim()}%`);
        conditions.push(`users.name ILIKE $${params.length}`);
    }

    if (conditions.length > 0) {
        query += " WHERE " + conditions.join(" AND ");
    }

    try {
        const result = await pool.query(query, params);
        return result.rows;
    } catch (error) {
        throw new Error(`Erro ao buscar usuários: ${error.message}`);
    }
};

const getUserById = async (id) => {
    try {
        const result = await pool.query("SELECT * FROM users WHERE id = $1", [id]);
        if (result.rows.length === 0) {
            throw new Error("Usuário não encontrado");
        }
        return result.rows[0];
    } catch (error) {
        throw new Error(`Erro ao buscar usuário por ID: ${error.message}`);
    }
};

const createUser = async (name, email, password, photo) => {
    try {
        const result = await pool.query(
            "INSERT INTO users (name, email, password, photo) VALUES ($1, $2, $3, $4) RETURNING *",
            [name, email, password, photo]
        );
        return result.rows[0];
    } catch (error) {
        throw new Error(`Erro ao criar usuário: ${error.message}`);
    }
};

const updateUser = async (id, name, email, password, photo) => {
    try {
        const currentUser = await pool.query("SELECT * FROM users WHERE id = $1", [id]);
        const user = currentUser.rows[0];

        if (!user) {
            throw new Error("Usuário não encontrado para atualização.");
        }

        const updatedName = name !== undefined ? name : user.name;
        const updatedEmail = email !== undefined ? email : user.email;
        const updatedPassword = password !== undefined ? password : user.password;
        const updatedPhoto = photo !== undefined ? photo : user.photo;

        const result = await pool.query(
            "UPDATE users SET name = $1, email = $2, password = $3, photo = $4 WHERE id = $5 RETURNING *",
            [updatedName, updatedEmail, updatedPassword, updatedPhoto, id]
        );
        return result.rows[0];
    } catch (error) {
        throw new Error(`Erro ao atualizar usuário: ${error.message}`);
    }
};

const deleteUser = async (id) => {
    try {
        const deletedUser = await pool.query("DELETE FROM users WHERE id = $1 RETURNING *", [id]);

        if (!deletedUser.rows[0]) {
            throw new Error("Usuário não encontrado para deletar.");
        }
        
        return deletedUser.rows[0];
    } catch (error) {
        throw new Error(`Erro ao deletar usuário: ${error.message}`);
    }
};

module.exports = { getUsers, getUserById, createUser, updateUser, deleteUser };