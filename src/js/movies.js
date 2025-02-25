const detailsModal = new bootstrap.Modal(document.getElementById("movie-details-modal"));

async function fetchMovies() {
    const moviesList = document.getElementById("movies-list");
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
    const moviesList = document.getElementById("movies-list");
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
                </div>
            </div>
        `;
        movieCard.addEventListener("click", () => showMovieDetails(movie));
        moviesList.appendChild(movieCard);
    });
}

async function showMovieDetails(movie) {
    const title = document.getElementById("movie-title");
    const image = document.getElementById("movie-image");
    const description = document.getElementById("movie-description");
    const info = document.getElementById("movie-info");
    const watchlistBtn = document.getElementById("add-watchlist");
    const watchedBtn = document.getElementById("add-watched");
    const droppedBtn = document.getElementById("add-dropped");
    const reviewBtn = document.getElementById("add-review");
    const reviewsList = document.getElementById("reviews-list");

    title.textContent = movie.title;
    image.src = movie.imageUri || "https://via.placeholder.com/300x300";
    description.textContent = movie.description || "No description available";
    info.textContent = `Year: ${movie.releaseYear} | Genre: ${movie.genre || "N/A"}`;

    const token = getToken();
    if (token) {
        watchlistBtn.classList.add("btn-sm", "me-2");
        watchedBtn.classList.add("btn-sm", "me-2");
        droppedBtn.classList.add("btn-sm", "me-2");
        reviewBtn.classList.add("btn-sm");
        watchlistBtn.onclick = () => addToList(movie.movieId, "watchlist");
        watchedBtn.onclick = () => addToList(movie.movieId, "watched");
        droppedBtn.onclick = () => addToList(movie.movieId, "dropped");
        reviewBtn.onclick = () => alert("Review functionality coming soon!");
    } else {
        watchlistBtn.classList.add("btn-sm", "me-2");
        watchedBtn.classList.add("btn-sm", "me-2");
        droppedBtn.classList.add("btn-sm", "me-2");
        reviewBtn.classList.add("btn-sm");
        watchlistBtn.onclick = () => requireAuth(() => addToList(movie.movieId, "watchlist"));
        watchedBtn.onclick = () => requireAuth(() => addToList(movie.movieId, "watched"));
        droppedBtn.onclick = () => requireAuth(() => addToList(movie.movieId, "dropped"));
        reviewBtn.onclick = () => requireAuth(() => alert("Review functionality coming soon!"));
    }

    try {
        const response = await fetch(`${BASE_URL}/reviews?movie_id=${movie.movieId}`, {
            credentials: "include"
        });
        const data = await response.json();
        if (Array.isArray(data)) {
            renderReviews(data);
        } else {
            reviewsList.innerHTML = '<p class="text-muted">No reviews yet.</p>';
        }
    } catch (error) {
        console.error("Fetch reviews error:", error);
        reviewsList.innerHTML = '<p class="text-muted">Error loading reviews.</p>';
    }

    detailsModal.show();
}

function renderReviews(reviews) {
    const reviewsList = document.getElementById("reviews-list");
    reviewsList.innerHTML = "<h6>Reviews:</h6>";
    reviews.forEach(review => {
        const reviewItem = document.createElement("div");
        reviewItem.className = "border-top pt-2 mt-2";
        reviewItem.innerHTML = `
            <p><strong>${review.username || "Anonymous"}:</strong> ${review.rating} ★</p>
            <p class="text-muted">${review.comment || "No comment"}</p>
            <small class="text-muted">${new Date(review.reviewDate).toLocaleDateString()}</small>
        `;
        reviewsList.appendChild(reviewItem);
    });
}

function requireAuth(callback) {
    const token = getToken();
    if (!token) {
        alert("Please login or signup to perform this action.");
        const authModal = new bootstrap.Modal(document.getElementById("auth-modal"));
        authModal.show();
    } else {
        callback();
    }
}

async function addToList(movieId, listType) {
    try {
        const response = await fetchWithAuth(`${BASE_URL}/lists?movie_id=${movieId}&type=${listType}`, {
            method: "POST"
        });
        const data = await response.json();
        alert(data.message);
    } catch (error) {
        console.error("Add to list error:", error);
        alert("Failed to add to list.");
    }
}