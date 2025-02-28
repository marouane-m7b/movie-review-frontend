const detailsModal = new bootstrap.Modal(document.getElementById("movie-details-modal"));

async function fetchMovies() {
    const moviesList = document.getElementById("movies-list");
    try {
        const response = await fetch(`${BASE_URL}/movies`, { credentials: "include" });
        const data = await response.json();
        if (data.status === "success") {
            renderMovies(data.data);
        } else {
            moviesList.innerHTML = '<p class="col text-center text-muted">Error fetching movies.</p>';
            showToast("Error fetching movies", "danger");
        }
    } catch (error) {
        console.error("Fetch movies error:", error);
        moviesList.innerHTML = '<p class="col text-center text-muted">Error fetching movies.</p>';
        showToast("Error fetching movies", "danger");
    }
}

function renderMovies(movies) {
    const moviesList = document.getElementById("movies-list");
    const movieElements = movies.map(movie => {
        const movieCard = document.createElement("div");
        movieCard.className = "col";
        movieCard.innerHTML = `
            <div class="card movie-card">
                <div class="poster-wrapper">
                    <img src="${movie.imageUri || 'https://via.placeholder.com/300x400'}" class="card-img-top" alt="${movie.title}" loading="lazy">
                    <span class="custom-tooltip">${movie.title}</span>
                </div>
                <div class="card-body">
                    <div class="actions">
                        <button onclick="requireAuth()" class="btn-icon text-white"><i class="fas fa-bookmark"></i></button>
                        <button onclick="requireAuth()" class="btn-icon text-white"><i class="fas fa-check"></i></button>
                        <button onclick="requireAuth()" class="btn-icon text-white"><i class="fas fa-times"></i></button>
                        <button onclick="requireAuth()" class="btn-icon text-white"><i class="fas fa-star"></i></button>
                    </div>
                    <div class="rating">${getAverageRating(movie.movieId)}</div>
                </div>
            </div>
        `;
        return movieCard;
    });
    moviesList.innerHTML = "";
    movieElements.forEach(element => moviesList.appendChild(element));
}

async function fetchMoviesUser() {
    const moviesList = document.getElementById("movies-list");
    try {
        const response = await fetchWithAuth(`${BASE_URL}/movies`);
        const data = await response.json();
        if (data.status === "success") {
            renderMoviesUser(data.data);
        } else {
            moviesList.innerHTML = '<p class="col text-center text-muted">Error fetching movies.</p>';
            showToast("Error fetching movies", "danger");
        }
    } catch (error) {
        console.error("Fetch movies error:", error);
        moviesList.innerHTML = '<p class="col text-center text-muted">Error fetching movies.</p>';
        showToast("Error fetching movies", "danger");
    }
}

async function renderMoviesUser(movies) {
    const moviesList = document.getElementById("movies-list");
    
    const watchlistResponse = await fetchWithAuth(`${BASE_URL}/lists?type=watchlist`);
    const watchlistData = await watchlistResponse.json();
    const watchedResponse = await fetchWithAuth(`${BASE_URL}/lists?type=watched`);
    const watchedData = await watchedResponse.json();
    const droppedResponse = await fetchWithAuth(`${BASE_URL}/lists?type=dropped`);
    const droppedData = await droppedResponse.json();
    const favoritesResponse = await fetchWithAuth(`${BASE_URL}/lists?type=favorites`);
    const favoritesData = await favoritesResponse.json();

    const movieElements = movies.map(movie => {
        const isInWatchlist = watchlistData.status === "success" && watchlistData.data.some(m => m.movieId === movie.movieId);
        const isWatched = watchedData.status === "success" && watchedData.data.some(m => m.movieId === movie.movieId);
        const isDropped = droppedData.status === "success" && droppedData.data.some(m => m.movieId === movie.movieId);
        const isFavorite = favoritesData.status === "success" && favoritesData.data.some(m => m.movieId === movie.movieId);

        const movieCard = document.createElement("div");
        movieCard.className = "col";
        movieCard.innerHTML = `
            <div class="movie-card" data-movie-id="${movie.movieId}">
                <img src="${movie.imageUri || 'https://via.placeholder.com/300x400'}" class="card-img-top" alt="${movie.title}" loading="lazy">
                <span class="custom-tooltip">${movie.title}</span>
                <div class="card-body">
                    <div class="actions">
                        <button onclick="toggleWatchlist(event, ${movie.movieId}, ${isInWatchlist})" class="btn-icon" style="color: ${isInWatchlist ? '#ffd700' : 'white'}"><i class="fas fa-bookmark"></i></button>
                        <button onclick="toggleList(event, ${movie.movieId}, 'watched', ${isWatched})" class="btn-icon" style="color: ${isWatched ? '#ffd700' : 'white'}"><i class="fas fa-check"></i></button>
                        <button onclick="toggleList(event, ${movie.movieId}, 'dropped', ${isDropped})" class="btn-icon" style="color: ${isDropped ? '#ffd700' : 'white'}"><i class="fas fa-times"></i></button>
                        <button onclick="toggleFavorite(event, ${movie.movieId}, ${isFavorite})" class="btn-icon" style="color: ${isFavorite ? '#ffd700' : 'white'}"><i class="fas fa-star"></i></button>
                    </div>
                    <div class="rating">${getAverageRating(movie.movieId)}</div>
                </div>
            </div>
        `;
        movieCard.querySelector('.card-img-top').addEventListener("click", () => showMovieDetails(movie));
        return movieCard;
    });
    
    moviesList.innerHTML = "";
    movieElements.forEach(element => moviesList.appendChild(element));
}

async function fetchTopMovies() {
    const carouselInner = document.getElementById("carousel-items");
    if (!carouselInner) return;

    try {
        const response = await fetch(`${BASE_URL}/movies`, { credentials: "include" });
        const data = await response.json();

        if (data.status === "success") {
            const topMovies = data.data;

            // Create a single carousel item with a row containing all movies
            const item = document.createElement("div");
            item.className = "carousel-item active"; // Ensure it's the active one

            const row = document.createElement("div");
            row.className = "row flex-nowrap overflow-hidden"; // Ensure continuous scrolling

            topMovies.forEach(movie => {
                const col = document.createElement("div");
                col.className = "col-md-2 position-relative"; // Show 6 at a time
                col.innerHTML = `
                    <img src="${movie.imageUri || 'https://via.placeholder.com/300x400'}" class="d-block w-100" alt="${movie.title}" loading="lazy">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>${movie.title}</h5>
                    </div>
                `;
                row.appendChild(col);
            });

            item.appendChild(row);
            carouselInner.appendChild(item);
        }
    } catch (error) {
        console.error("Fetch top movies error:", error);
    }
}


async function fetchRecommendations() {
    const recommendationsList = document.getElementById("recommendations");
    if (!recommendationsList) return;

    try {
        const response = await fetch(`${BASE_URL}/movies`, { credentials: "include" });
        const data = await response.json();
        if (data.status === "success") {
            const recommended = data.data.slice(0, 4);
            const movieElements = recommended.map(movie => {
                const movieCard = document.createElement("div");
                movieCard.className = "col";
                movieCard.innerHTML = `
                    <div class="card movie-card" data-movie-id="${movie.movieId}">
                        <img src="${movie.imageUri || 'https://via.placeholder.com/300x400'}" class="card-img-top" alt="${movie.title}" loading="lazy">
                        <span class="custom-tooltip">${movie.title}</span>
                        <div class="card-body">
                            <div class="actions">
                                <button onclick="toggleWatchlist(event, ${movie.movieId}, false)" class="btn-icon text-white"><i class="fas fa-bookmark"></i></button>
                                <button onclick="toggleList(event, ${movie.movieId}, 'watched', false)" class="btn-icon text-white"><i class="fas fa-check"></i></button>
                                <button onclick="toggleList(event, ${movie.movieId}, 'dropped', false)" class="btn-icon text-white"><i class="fas fa-times"></i></button>
                                <button onclick="toggleFavorite(event, ${movie.movieId}, false)" class="btn-icon text-white"><i class="fas fa-star"></i></button>
                            </div>
                            <div class="rating">${getAverageRating(movie.movieId)}</div>
                        </div>
                    </div>
                `;
                movieCard.querySelector('.card-img-top').addEventListener("click", () => showMovieDetails(movie));
                return movieCard;
            });
            movieElements.forEach(element => recommendationsList.appendChild(element));
        }
    } catch (error) {
        console.error("Fetch recommendations error:", error);
        recommendationsList.innerHTML = '<p class="col text-center text-muted">Error loading recommendations.</p>';
        showToast("Error loading recommendations", "danger");
    }
}

async function showMovieDetails(movie) {
    const title = document.getElementById("movie-title");
    const image = document.getElementById("movie-image");
    const description = document.getElementById("movie-description");
    const info = document.getElementById("movie-info");
    const watchlistBtn = document.getElementById("add-watchlist");
    const watchedBtn = document.getElementById("add-watched");
    const droppedBtn = document.getElementById("add-dropped");
    const favoriteBtn = document.getElementById("add-favorite");
    const reviewBtn = document.getElementById("add-review");
    const reviewsList = document.getElementById("reviews-list");
    const reviewForm = document.getElementById("submit-review-form");
    const editReviewForm = document.getElementById("edit-review-form-inner");

    title.textContent = movie.title;
    image.src = movie.imageUri || "https://via.placeholder.com/300x400";
    description.textContent = movie.description || "No description available";
    info.textContent = `Year: ${movie.releaseYear} | Genre: ${movie.genre || "N/A"}`;

    const token = getToken();
    if (token) {
        const watchlistResponse = await fetch(`${BASE_URL}/lists?type=watchlist`, { credentials: "include" });
        const watchlistData = await watchlistResponse.json();
        const isInWatchlist = watchlistData.status === "success" && watchlistData.data.some(m => m.movieId === movie.movieId);

        const watchedResponse = await fetch(`${BASE_URL}/lists?type=watched`, { credentials: "include" });
        const watchedData = await watchedResponse.json();
        const isWatched = watchedData.status === "success" && watchedData.data.some(m => m.movieId === movie.movieId);

        const droppedResponse = await fetch(`${BASE_URL}/lists?type=dropped`, { credentials: "include" });
        const droppedData = await droppedResponse.json();
        const isDropped = droppedData.status === "success" && droppedData.data.some(m => m.movieId === movie.movieId);

        const favoritesResponse = await fetch(`${BASE_URL}/lists?type=favorites`, { credentials: "include" });
        const favoritesData = await favoritesResponse.json();
        const isFavorite = favoritesData.status === "success" && favoritesData.data.some(m => m.movieId === movie.movieId);

        watchlistBtn.style.color = isInWatchlist ? '#ffd700' : 'white';
        watchlistBtn.onclick = (e) => toggleWatchlist(e, movie.movieId, isInWatchlist);

        watchedBtn.style.color = isWatched ? '#ffd700' : 'white';
        watchedBtn.onclick = (e) => toggleList(e, movie.movieId, "watched", isWatched);

        droppedBtn.style.color = isDropped ? '#ffd700' : 'white';
        droppedBtn.onclick = (e) => toggleList(e, movie.movieId, "dropped", isDropped);

        favoriteBtn.style.color = isFavorite ? '#ffd700' : 'white';
        favoriteBtn.onclick = (e) => toggleFavorite(e, movie.movieId, isFavorite);

        reviewBtn.onclick = () => {};
        setupReviewForm(movie.movieId);
        setupEditReviewForm(movie.movieId);
    } else {
        watchlistBtn.onclick = () => requireAuth();
        watchedBtn.onclick = () => requireAuth();
        droppedBtn.onclick = () => requireAuth();
        favoriteBtn.onclick = () => requireAuth();
        reviewBtn.onclick = () => requireAuth();
        reviewForm.style.display = "none";
        editReviewForm.style.display = "none";
    }

    await refreshReviews(movie.movieId, reviewsList);
    detailsModal.show();
}

async function refreshReviews(movieId, reviewsList) {
    try {
        const response = await fetch(`${BASE_URL}/reviews?movie_id=${movieId}`, { credentials: "include" });
        const data = await response.json();
        console.log("Reviews fetch:", data);
        if (data.status === "success" && Array.isArray(data.data)) {
            renderReviews(data.data, reviewsList);
        } else {
            reviewsList.innerHTML = '<p class="text-muted">No reviews yet.</p>';
        }
    } catch (error) {
        console.error("Fetch reviews error:", error);
        reviewsList.innerHTML = '<p class="text-muted">Error loading reviews.</p>';
        showToast("Error loading reviews", "danger");
    }
}

function renderReviews(reviews, reviewsList) {
    reviewsList.innerHTML = "<h6>Reviews:</h6>";
    if (!reviews || reviews.length === 0) {
        reviewsList.innerHTML += '<p class="text-muted">No reviews yet.</p>';
        return;
    }
    const currentUserId = getCurrentUserId();
    console.log("Current user ID:", currentUserId);
    reviews.forEach(review => {
        const reviewItem = document.createElement("div");
        reviewItem.className = "border-top pt-2 mt-2";
        const canEdit = currentUserId && review.userId === currentUserId;
        const stars = '<i class="fas fa-star star-rating"></i>'.repeat(review.rating) + '<i class="far fa-star star-rating"></i>'.repeat(5 - review.rating);
        reviewItem.innerHTML = `
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <p><strong>${review.username || "Anonymous"}:</strong> ${stars}</p>
                    <p class="text-muted">${review.comment || "No comment"}</p>
                    <small class="text-muted">${new Date(review.reviewDate).toLocaleDateString()}</small>
                </div>
                ${canEdit ? `<button class="btn btn-outline-primary btn-sm" onclick="editReview(${review.reviewId}, ${review.rating}, '${encodeURIComponent(review.comment || '')}')"><i class="fas fa-edit"></i></button>` : ""}
            </div>
        `;
        reviewsList.appendChild(reviewItem);
    });
}

function requireAuth() {
    const authModal = new bootstrap.Modal(document.getElementById("auth-modal"));
    authModal.show();
}

async function toggleWatchlist(event, movieId, isInWatchlist) {
    event.stopPropagation(); // Prevent modal trigger
    try {
        const method = isInWatchlist ? "DELETE" : "POST";
        const response = await fetchWithAuth(`${BASE_URL}/lists?movie_id=${movieId}&type=watchlist`, { method });
        const data = await response.json();
        if (data.status === "success") {
            const watchlistBtn = document.getElementById("add-watchlist");
            watchlistBtn.style.color = isInWatchlist ? 'white' : '#ffd700';
            watchlistBtn.onclick = (e) => toggleWatchlist(e, movieId, !isInWatchlist);
            fetchMoviesUser();
            showToast(data.message, "success");
        } else {
            showToast(data.message || "Failed to update watchlist", "danger");
        }
    } catch (error) {
        console.error("Toggle watchlist error:", error);
        showToast("Failed to update watchlist", "danger");
    }
}

async function toggleList(event, movieId, listType, isInList) {
    event.stopPropagation(); // Prevent modal trigger
    try {
        const method = isInList ? "DELETE" : "POST";
        const response = await fetchWithAuth(`${BASE_URL}/lists?movie_id=${movieId}&type=${listType}`, { method });
        const data = await response.json();
        if (data.status === "success") {
            const btn = listType === "watched" ? document.getElementById("add-watched") : document.getElementById("add-dropped");
            btn.style.color = isInList ? 'white' : '#ffd700';
            btn.onclick = (e) => toggleList(e, movieId, listType, !isInList);
            fetchMoviesUser();
            showToast(data.message, "success");
        } else {
            showToast(data.message || `Failed to ${isInList ? 'remove from' : 'add to'} ${listType}`, "danger");
        }
    } catch (error) {
        console.error(`Toggle ${listType} error:`, error);
        showToast(`Failed to ${isInList ? 'remove from' : 'add to'} ${listType}`, "danger");
    }
}

async function toggleFavorite(event, movieId, isFavorite) {
    event.stopPropagation(); // Prevent modal trigger
    try {
        const method = isFavorite ? "DELETE" : "POST";
        const response = await fetchWithAuth(`${BASE_URL}/lists?movie_id=${movieId}&type=favorites`, { method });
        const data = await response.json();
        if (data.status === "success") {
            const favoriteBtn = document.getElementById("add-favorite");
            favoriteBtn.style.color = isFavorite ? 'white' : '#ffd700';
            favoriteBtn.onclick = (e) => toggleFavorite(e, movieId, !isFavorite);
            fetchMoviesUser();
            fetchFavorites();
            showToast(data.message, "success");
        } else {
            showToast(data.message || "Failed to update favorites", "danger");
        }
    } catch (error) {
        console.error("Toggle favorite error:", error);
        showToast("Failed to update favorites", "danger");
    }
}

async function setupReviewForm(movieId) {
    const reviewForm = document.getElementById("submit-review-form");
    const reviewsList = document.getElementById("reviews-list");

    const newForm = reviewForm.cloneNode(true);
    reviewForm.parentNode.replaceChild(newForm, reviewForm);

    newForm.addEventListener("submit", async (e) => {
        e.preventDefault();
        const rating = document.getElementById("review-rating").value;
        const comment = document.getElementById("review-comment").value;

        try {
            const response = await fetchWithAuth(`${BASE_URL}/reviews`, {
                method: "POST",
                body: `movie_id=${encodeURIComponent(movieId)}&rating=${encodeURIComponent(rating)}&comment=${encodeURIComponent(comment)}`
            });
            const data = await response.json();
            console.log("Review submission response:", data);
            if (data.status === "success") {
                showToast("Review submitted successfully!", "success");
                await refreshReviews(movieId, reviewsList);
                newForm.reset();
                document.getElementById("review-form").classList.remove("show");
            } else {
                showToast(data.message || "Failed to submit review", "danger");
            }
        } catch (error) {
            console.error("Submit review error:", error);
            showToast("Failed to submit review", "danger");
        }
    });
}

async function setupEditReviewForm(movieId) {
    const editForm = document.getElementById("edit-review-form-inner");
    const reviewsList = document.getElementById("reviews-list");

    const newEditForm = editForm.cloneNode(true);
    editForm.parentNode.replaceChild(newEditForm, editForm);

    newEditForm.addEventListener("submit", async (e) => {
        e.preventDefault();
        const reviewId = document.getElementById("edit-review-id").value;
        const rating = document.getElementById("edit-review-rating").value;
        const comment = document.getElementById("edit-review-comment").value;

        const body = `review_id=${encodeURIComponent(reviewId)}&rating=${encodeURIComponent(rating)}&comment=${encodeURIComponent(comment)}`;
        console.log("Edit review request body:", body);

        try {
            const response = await fetchWithAuth(`${BASE_URL}/reviews`, {
                method: "PUT",
                body: body
            });
            const data = await response.json();
            console.log("Review edit response:", data);
            if (data.status === "success") {
                showToast("Review updated successfully!", "success");
                await refreshReviews(movieId, reviewsList);
                newEditForm.reset();
                document.getElementById("edit-review-form").classList.remove("show");
            } else {
                showToast(data.message || "Failed to update review", "danger");
            }
        } catch (error) {
            console.error("Edit review error:", error);
            showToast("Failed to update review", "danger");
        }
    });
}

function editReview(reviewId, rating, comment) {
    const editReviewId = document.getElementById("edit-review-id");
    const editRating = document.getElementById("edit-review-rating");
    const editComment = document.getElementById("edit-review-comment");
    const editForm = document.getElementById("edit-review-form");

    console.log("Editing review:", { reviewId, rating, comment: decodeURIComponent(comment) });
    editReviewId.value = reviewId;
    editRating.value = rating;
    editComment.value = decodeURIComponent(comment);
    editForm.classList.add("show");
}

function setupSearch() {
    const searchForm = document.getElementById("search-form");
    const clearSearchBtn = document.getElementById("clear-search");
    if (!searchForm || !clearSearchBtn) return;

    searchForm.addEventListener("submit", async (e) => {
        e.preventDefault();
        const query = document.getElementById("search-input").value.trim();
        if (!query) return;

        try {
            const response = await fetch(`${BASE_URL}/movies/search?q=${encodeURIComponent(query)}`, { credentials: "include" });
            const data = await response.json();
            console.log("Search response:", data);
            if (data.status === "success") {
                const isUserPage = window.location.pathname.includes("user.html");
                isUserPage ? renderMoviesUser(data.data) : renderMovies(data.data);
            } else {
                const moviesList = document.getElementById("movies-list");
                moviesList.innerHTML = '<p class="col text-center text-muted">No movies found.</p>';
                showToast("No movies found", "warning");
            }
        } catch (error) {
            console.error("Search error:", error);
            const moviesList = document.getElementById("movies-list");
            moviesList.innerHTML = '<p class="col text-center text-muted">Error searching movies.</p>';
            showToast("Error searching movies", "danger");
        }
    });

    clearSearchBtn.addEventListener("click", () => {
        document.getElementById("search-input").value = "";
        const isUserPage = window.location.pathname.includes("user.html");
        isUserPage ? fetchMoviesUser() : fetchMovies();
    });
}

function filterMovies(key, value) {
    fetch(`${BASE_URL}/movies`, { credentials: "include" })
        .then(response => response.json())
        .then(data => {
            if (data.status === "success") {
                const filtered = data.data.filter(movie => movie[key] === value);
                const isUserPage = window.location.pathname.includes("user.html");
                isUserPage ? renderMoviesUser(filtered) : renderMovies(filtered);
            }
        })
        .catch(error => {
            console.error("Filter error:", error);
            showToast("Error filtering movies", "danger");
        });
}

function getAverageRating(movieId) {
    return "★★★★☆"; // Placeholder
}

function getCurrentListType() {
    const path = window.location.pathname;
    if (path.includes("watchlist.html")) return "watchlist";
    if (path.includes("watched.html")) return "watched";
    if (path.includes("dropped.html")) return "dropped";
    if (path.includes("favorites.html")) return "favorites";
    return null;
}

async function fetchFavorites() {
    const favoritesList = document.getElementById("favorites-list");
    if (!favoritesList) return;

    try {
        const response = await fetchWithAuth(`${BASE_URL}/lists?type=favorites`);
        const data = await response.json();
        console.log("Favorites fetch:", data);
        if (data.status === "success" && Array.isArray(data.data)) {
            renderFavorites(data.data);
        } else {
            favoritesList.innerHTML = '<p class="col text-center text-muted">No favorite movies yet.</p>';
        }
    } catch (error) {
        console.error("Fetch favorites error:", error);
        favoritesList.innerHTML = '<p class="col text-center text-muted">Error loading favorites.</p>';
        showToast("Error loading favorites", "danger");
    }
}

async function renderFavorites(movies) {
    const favoritesList = document.getElementById("favorites-list");
    favoritesList.innerHTML = "";
    if (!movies || movies.length === 0) {
        favoritesList.innerHTML = '<p class="col text-center text-muted">No favorite movies yet.</p>';
        return;
    }

    const movieElements = movies.map(movie => {
        const movieCard = document.createElement("div");
        movieCard.className = "col";
        movieCard.innerHTML = `
            <div class="card movie-card">
                <img src="${movie.imageUri || 'https://via.placeholder.com/300x400'}" class="card-img-top" alt="${movie.title}" loading="lazy">
                <span class="custom-tooltip">${movie.title}</span>
                <div class="card-body">
                    <div class="actions">
                        <button onclick="toggleFavorite(event, ${movie.movieId}, true)" class="btn-icon" style="color: #ffd700"><i class="fas fa-star"></i></button>
                    </div>
                    <div class="rating">${getAverageRating(movie.movieId)}</div>
                </div>
            </div>
        `;
        return movieCard;
    });
    movieElements.forEach(element => favoritesList.appendChild(element));
}

// Toast notification function
function showToast(message, type) {
    const toastContainer = document.getElementById("toast-container");
    const toast = document.createElement("div");
    toast.className = `toast align-items-center text-white bg-${type} border-0`;
    toast.setAttribute("role", "alert");
    toast.setAttribute("aria-live", "assertive");
    toast.setAttribute("aria-atomic", "true");
    toast.innerHTML = `
        <div class="d-flex">
            <div class="toast-body">${message}</div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    `;
    toastContainer.appendChild(toast);
    const bsToast = new bootstrap.Toast(toast);
    bsToast.show();
    setTimeout(() => toast.remove(), 3000); // Auto-remove after 3 seconds
}