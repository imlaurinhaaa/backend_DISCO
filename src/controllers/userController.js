const userModel = require("../models/userModel");

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

const createUser = async (req, res) => {
    try {
        const { name, email, password } = req.body;
        const photo = req.file ? req.file.filename : null;
        const newUser = await userModel.createUser(name, email, password, photo);
        res.status(201).json({ message: "Usuário criado com sucesso.", user: newUser });
    } catch (error) {
        res.status(500).json({ message: `Erro ao criar usuário: ${error.message}` });
    }
};

const updateUser = async (req, res) => {
    try {
        const { name, email, password } = req.body;
        const photo = req.file ? req.file.filename : null;
        const updatedUser = await userModel.updateUser(req.params.id, name, email, password, photo);
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

module.exports = { getUsers, getUserById, createUser, updateUser, deleteUser };