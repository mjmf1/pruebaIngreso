const axios = require('axios');

// Función para obtener los repositorios más populares de un usuario
async function getPopularRepos(username) {
    try {
        // Hacer la solicitud a la API de GitHub
        const response = await axios.get(`https://api.github.com/users/${username}/repos`, {
            params: {
                sort: 'stars', // Ordenar por estrellas
                direction: 'desc', // En orden descendente
                per_page: 10 // Obtener solo los 10 primeros
            }
        });

        // Extraer los datos de los repositorios
        let repos = response.data;

        // Ordenar los repositorios explícitamente por estrellas en orden descendente
        repos.sort((a, b) => b.stargazers_count - a.stargazers_count);

        // Mostrar los repositorios
        console.log(`Los 10 repositorios más populares de ${username} son:`);
        repos.forEach(repo => {
            console.log(`- ${repo.name}: ${repo.stargazers_count} estrellas`);
        });
    } catch (error) {
        console.error('Error al obtener los repositorios:', error);
    }
}

// Llamar a la función con el usuario "google"
getPopularRepos('google');
