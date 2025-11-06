const favoritesModel = require("../models/favoritesModel");

const getFavorites = async (req, res) => {
    try {
        const { user_id } = req.params;

        // Valida se o user_id foi fornecido
        if (!user_id) {
            return res.status(400).json({ message: "O ID do usuário é obrigatório." });
        }

        // Busca os favoritos do usuário
        const favorites = await favoritesModel.getFavorites(user_id);

        // Retorna a resposta com os favoritos encontrados
        res.status(200).json({ 
            message: "Favoritos encontrados com sucesso.", 
            count: favorites.length, 
            favorites 
        });
    } catch (error) {
        console.error(`Erro ao buscar favoritos: ${error.message}`);
        res.status(500).json({ message: `Erro ao encontrar favoritos: ${error.message}` });
    }
};

// Rota para buscar um favorito pelo ID
const getFavoriteById = async (req, res) => {
    try {
        const favorite = await favoritesModel.getFavoriteById(req.params.id);
        if (!favorite) {
            return res.status(404).json({ message: "Favorito não encontrado." });
        }
        res.status(200).json({ message: "Favorito encontrado com sucesso.", favorite });
    } catch (error) {
        console.error(`Erro ao buscar favorito: ${error.message}`);
        res.status(404).json({ message: `Erro ao encontrar favorito: ${error.message}` });
    }
};


// Rota para criar um novo favorito
const createFavorite = async (req, res) => {
    try {
        const { user_id, singer_id, album_id, song_id } = req.body;

        // Valida os campos obrigatórios
        if ( !user_id ) {
            return res.status(400).json({ message: "O campo 'user_id' é obrigatório." });
        }

        const newFavorite = await favoritesModel.createFavorite(user_id, singer_id, album_id, song_id);
        return res.status(201).json({ message: "Favorito criado com sucesso.", newFavorite });
    } catch (error) {
        console.error(`Erro ao criar favorito: ${error.message}`);
        return res.status(500).json({ message: `Erro ao criar favorito: ${error.message}` });
    }
};

// Rota para atualizar os dados de um favorito
const updateFavorite = async (req, res) => {
    try {
        const { singer_id, album_id, song_id } = req.body;
        const updatedFavorite = await favoritesModel.updateFavorite(req.params.id, singer_id, album_id, song_id);

        if (!updatedFavorite) {
            return res.status(404).json({ message: "Favorito não encontrado para atualização." });
        }
        res.status(200).json({ message: "Favorito atualizado com sucesso.", updatedFavorite });
    } catch (error) {
        console.error(`Erro ao atualizar favorito: ${error.message}`);
        res.status(500).json({ message: `Erro ao atualizar favorito: ${error.message}` });
    }
};

// Rota para deletar um favorito
const deleteFavorite = async (req, res) => {
    try {
        const deletedFavorite = await favoritesModel.deleteFavorite(req.params.id);
        if (!deletedFavorite) {
            return res.status(404).json({ message: "Favorito não encontrado para exclusão." });
        }
        res.status(200).json({ message: "Favorito deletado com sucesso.", details: deletedFavorite });
    } catch (error) {
        console.error(`Erro ao deletar favorito: ${error.message}`);
        res.status(500).json({ message: `Erro ao deletar favorito: ${error.message}` });
    }
};

module.exports = { 
    getFavorites, 
    getFavoriteById, 
    createFavorite, 
    updateFavorite, 
    deleteFavorite
};
