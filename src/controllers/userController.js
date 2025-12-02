const userModel = require("../models/userModel");
const pool = require("../config/database");

const getUsers = async (req, res) => {
    try {
        const { name } = req.query;
        const users = await userModel.getUsers(name);
        res.status(200).json({ message: "Usuários buscados com sucesso.", users });
    } catch (error) {
        res.status(500).json({ message: `Erro ao buscar usuários: ${error.message}` });
    }
};

const getUserById = async (req, res) => {
    try {
        const { id } = req.params;
        const user = await userModel.getUserById(id);
        res.status(200).json({ message: "Usuário buscado com sucesso.", user });
    } catch (error) {
        res.status(500).json({ message: `Erro ao buscar usuário por ID: ${error.message}` });
    }
};

const registerUser = async (req, res) => {
    try {
        const { name, email, password } = req.body;

        const photo = req.file ? req.file.filename : (req.body.photo || null);

        if (!name || !email || !password) {
            return res.status(400).json({ error: "Campos obrigatórios não enviados" });
        }

        const newUser = await userModel.registerUser(name, email, String(password), photo);

        res.status(201).json({ message: "Usuário registrado com sucesso.", user: newUser });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

const loginUser = async (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).json({ error: "Preencha e-mail e senha" });
    }

    try {
        const result = await pool.query("SELECT * FROM users WHERE email = $1", [email]);
        const user = result.rows[0];

        if (!user) {
            return res.status(401).json({ error: "Usuário não encontrado" });
        }

        // senha em texto puro
        if (user.password !== password) {
            return res.status(401).json({ error: "Senha incorreta" });
        }

        // remover senha do retorno
        const { password: _, ...userWithoutPassword } = user;

        res.status(200).json({ user: userWithoutPassword });
    } catch (error) {
        console.error("Erro no login:", error);
        res.status(500).json({ error: "Erro interno ao tentar logar" });
    }
};

const createUser = async (req, res) => {
    try {
        const { name, email, password, photo } = req.body;

        const newUser = await userModel.createUser(
            name,
            email,
            password,
            photo || null
        );

        res.status(201).json({
            message: "Usuário criado com sucesso!",
            user: newUser
        });

    } catch (error) {
        console.error("Erro ao criar usuário:", error);
        res.status(500).json({ error: "Erro ao criar usuário" });
    }
};

const updateUser = async (req, res) => {
    try {
        const { name, email, password } = req.body;
        const photo = req.file ? req.file.filename : null;

        // password pode vir undefined → o model já trata isso
        const updatedUser = await userModel.updateUser(
            req.params.id,
            name,
            email,
            password !== undefined ? String(password) : undefined,
            photo
        );

        res.status(200).json({ message: "Usuário atualizado com sucesso.", user: updatedUser });
    } catch (error) {
        res.status(500).json({ message: `Erro ao atualizar usuário: ${error.message}` });
    }
};

const deleteUser = async (req, res) => {
    try {
        const deletedUser = await userModel.deleteUser(req.params.id);
        res.status(200).json({ message: "Usuário deletado com sucesso.", user: deletedUser });
    } catch (error) {
        res.status(500).json({ message: `Erro ao deletar usuário: ${error.message}` });
    }
};

module.exports = {
    getUsers,
    getUserById,
    createUser,
    updateUser,
    deleteUser,
    registerUser,
    loginUser
};
