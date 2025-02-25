const BASE_URL = "http://localhost:8080/Movies_Review";
const moviesList = document.getElementById("movies-list");
const loginBtn = document.getElementById("login-btn");
const logoutBtn = document.getElementById("logout-btn");
const loginModal = new bootstrap.Modal(document.getElementById("login-modal"));
const loginForm = document.getElementById("login-form");
const csrfTokenInput = document.getElementById("csrf-token");
const adminSection = document.getElementById("admin-section");
const addMovieForm = document.getElementById("add-movie-form");

// Token Management
let token = localStorage.getItem("token");
let isAdmin = false;

// Check Auth State
async function checkAuth() {
    if (token) {
        loginBtn.classList.add("d-none");
        logoutBtn.classList.remove("d-none");
        await checkAdminStatus();
        if (isAdmin) {
            adminSection.classList.remove("d-none");
        }
    } else {
        loginBtn.classList.remove("d-none");
        logoutBtn.classList.add("d-none");
        adminSection.classList.add("d-none");
    }
    fetchMovies();
}

// Fetch CSRF Token
async function fetchCsrfToken() {
    try {
        const response = await fetch(`${BASE_URL}/login`, {
            credentials: "include"
        });
        const data = await response.json();
        csrfTokenInput.value = data.csrfToken;
        return data.csrfToken;
    } catch (error) {
        console.error("Error fetching CSRF token:", error);
    }
}

// Check Admin Status
async function checkAdminStatus() {
    try {
        const response = await fetch(`${BASE_URL}/profile`, {
            headers: { "Authorization": `Bearer ${token}` },
            credentials: "include"
        });
        const data = await response.json();
        if (data.status === "success" && data.data.isAdmin) {
            isAdmin = true;
        } else {
            isAdmin = false;
        }
    } catch (error) {
        console.error("Error checking admin status:", error);
        isAdmin = false;
    }
}

// Login Handlers
loginBtn.addEventListener("click", () => {
    fetchCsrfToken().then(() => loginModal.show());
});

loginForm.addEventListener("submit", async (e) => {
    e.preventDefault();
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    const csrfToken = csrfTokenInput.value;

    try {
        const response = await fetch(`${BASE_URL}/login`, {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: `username=${encodeURIComponent(username)}&password=${encodeURIComponent(password)}&csrf_token=${encodeURIComponent(csrfToken)}`,
            credentials: "include"
        });
        const data = await response.json();
        if (data.status === "success") {
            token = data.token;
            localStorage.setItem("token", token);
            loginModal.hide();
            checkAuth();
        } else {
            alert(data.message);
        }
    } catch (error) {
        console.error("Login error:", error);
        alert("An error occurred during login.");
    }
});

// Logout Handler
logoutBtn.addEventListener("click", async () => {
    try {
        const response = await fetch(`${BASE_URL}/logout`, {
            method: "POST",
            headers: { "Authorization": `Bearer ${token}` },
            credentials: "include"
        });
        const data = await response.json();
        if (data.status === "success") {
            localStorage.removeItem("token");
            token = null;
            isAdmin = false;
            checkAuth();
        } else {
            alert(data.message);
        }
    } catch (error) {
        console.error("Logout error:", error);
    }
});

// Fetch Movies
async function fetchMovies() {
    try {
        const response = await fetch(`${BASE_URL}/movies`, {
            credentials: "include"
        });
        const data = await response.json();
        if (data.status === "success") {
            renderMovies(data.data);
        } else {
            moviesList.innerHTML = '<p class="col text-center text-muted">Error fetching movies.</p>';
        }
    } catch (error) {
        console.error("Fetch movies error:", error);
        moviesList.innerHTML = '<p class="col text-center text-muted">Error fetching movies.</p>';
    }
}

function renderMovies(movies) {
    moviesList.innerHTML = "";
    movies.forEach(movie => {
        const movieCard = document.createElement("div");
        movieCard.className = "col";
        movieCard.innerHTML = `
            <div class="card movie-card h-100">
                <img src="${movie.imageUri || 'https://via.placeholder.com/300x300'}" class="card-img-top" alt="${movie.title}">
                <div class="card-body">
                    <h5 class="card-title">${movie.title}</h5>
                    <p class="card-text text-muted">${movie.description || "No description available"}</p>
                    <p class="card-text"><small class="text-muted">Year: ${movie.releaseYear} | Genre: ${movie.genre || "N/A"}</small></p>
                    ${isAdmin ? `<button onclick="deleteMovie(${movie.movieId})" class="btn btn-danger btn-sm mt-2">Delete</button>` : ""}
                </div>
            </div>
        `;
        moviesList.appendChild(movieCard);
    });
}

// Add Movie
addMovieForm.addEventListener("submit", async (e) => {
    e.preventDefault();
    const title = document.getElementById("movie-title").value;
    const year = document.getElementById("movie-year").value;
    const imageUri = document.getElementById("movie-image").value;

    try {
        const response = await fetch(`${BASE_URL}/movies`, {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded",
                "Authorization": `Bearer ${token}`
            },
            body: `title=${encodeURIComponent(title)}&release_year=${encodeURIComponent(year)}&image_uri=${encodeURIComponent(imageUri)}`,
            credentials: "include"
        });
        const data = await response.json();
        if (data.status === "success") {
            fetchMovies();
            addMovieForm.reset();
        } else {
            alert(data.message);
        }
    } catch (error) {
        console.error("Add movie error:", error);
        alert("Failed to add movie.");
    }
});

// Delete Movie
async function deleteMovie(movieId) {
    if (!confirm("Are you sure you want to delete this movie?")) return;

    try {
        const response = await fetch(`${BASE_URL}/movies?movie_id=${movieId}`, {
            method: "DELETE",
            headers: { "Authorization": `Bearer ${token}` },
            credentials: "include"
        });
        const data = await response.json();
        if (data.status === "success") {
            fetchMovies();
        } else {
            alert(data.message);
        }
    } catch (error) {
        console.error("Delete movie error:", error);
        alert("Failed to delete movie.");
    }
}

// Initial Check
checkAuth();