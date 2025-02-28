const detailsModal = new bootstrap.Modal(document.getElementById("movie-details-modal"));

async function fetchMovies() {
    const moviesList = document.getElementById("movies-list");
    try {
        const response = await fetch(`${BASE_URL}/movies`, { credentials: "include" });
        const data = await response.json();
        if (data.status === "success") {
            renderMovies(data.data);
        } else {
            moviesList.innerHTML = '<p class="col text-center ">Error fetching movies.</p>';
            showToast("Error fetching movies", "danger");
        }
    } catch (error) {
        console.error("Fetch movies error:", error);
        moviesList.innerHTML = '<p class="col text-center ">Error fetching movies.</p>';
        showToast("Error fetching movies", "danger");
    }
}

function renderMovies(movies) {
    const moviesList = document.getElementById("movies-list");

    const sortedMovies = movies.slice().sort((a, b) => b.reviewCount - a.reviewCount);

    const movieElements = sortedMovies.map(movie => {
        const movieCard = document.createElement("div");
        movieCard.className = "col";
        movieCard.innerHTML = `
            <div class="card movie-card">
                <div class="rating">${getAverageRating(movie)}</div>
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
            moviesList.innerHTML = '<p class="col text-center ">Error fetching movies.</p>';
            showToast("Error fetching movies", "danger");
        }
    } catch (error) {
        console.error("Fetch movies error:", error);
        moviesList.innerHTML = '<p class="col text-center ">Error fetching movies.</p>';
        showToast("Error fetching movies", "danger");
    }
}

async function renderMoviesUser(movies, listType) {
    const moviesList = document.getElementById("movies-list");

    const sortedMovies = movies.slice().sort((a, b) => b.reviewCount - a.reviewCount);

    const watchlistResponse = await fetchWithAuth(`${BASE_URL}/lists?type=watchlist`);
    const watchlistData = await watchlistResponse.json();
    const watchedResponse = await fetchWithAuth(`${BASE_URL}/lists?type=watched`);
    const watchedData = await watchedResponse.json();
    const droppedResponse = await fetchWithAuth(`${BASE_URL}/lists?type=dropped`);
    const droppedData = await droppedResponse.json();
    const favoritesResponse = await fetchWithAuth(`${BASE_URL}/lists?type=favorites`);
    const favoritesData = await favoritesResponse.json();

    const movieElementsPromises = sortedMovies.map(async movie => {
        const isInWatchlist = watchlistData.status === "success" && watchlistData.data.some(m => m.movieId === movie.movieId);
        const isWatched = watchedData.status === "success" && watchedData.data.some(m => m.movieId === movie.movieId);
        const isDropped = droppedData.status === "success" && droppedData.data.some(m => m.movieId === movie.movieId);
        const isFavorite = favoritesData.status === "success" && favoritesData.data.some(m => m.movieId === movie.movieId);
        const rating = await getAverageRating(movie); // Await the rating

        const movieCard = document.createElement("div");
        movieCard.className = "col";
        movieCard.innerHTML = `
            <div class="movie-card" data-movie-id="${movie.movieId}">
                <img src="${movie.imageUri || 'https://via.placeholder.com/300x400'}" class="card-img-top" alt="${movie.title}" loading="lazy">
                <div class="rating">${getAverageRating(movie)}</div>
                <span class="custom-tooltip">${movie.title}</span>
                <div class="card-body">
                    <div class="actions">
                        <button onclick="toggleWatchlist(event, ${movie.movieId}, ${isInWatchlist}, '${listType}')" class="btn-icon" style="color: ${isInWatchlist ? '#ffd700' : 'white'}"><i class="fas fa-bookmark"></i></button>
                        <button onclick="toggleList(event, ${movie.movieId}, 'watched', ${isWatched}, '${listType}')" class="btn-icon" style="color: ${isWatched ? '#ffd700' : 'white'}"><i class="fas fa-check"></i></button>
                        <button onclick="toggleList(event, ${movie.movieId}, 'dropped', ${isDropped}, '${listType}')" class="btn-icon" style="color: ${isDropped ? '#ffd700' : 'white'}"><i class="fas fa-times"></i></button>
                        <button onclick="toggleFavorite(event, ${movie.movieId}, ${isFavorite}, '${listType}')" class="btn-icon" style="color: ${isFavorite ? '#ffd700' : 'white'}"><i class="fas fa-star"></i></button>
                    </div>
                </div>
            </div>
        `;
        movieCard.querySelector('.card-img-top').addEventListener("click", () => showMovieDetails(movie, listType));
        return movieCard;
    });

    const movieElements = await Promise.all(movieElementsPromises); // Resolve all promises
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
                    <div class="rating">${getAverageRating(movie)}</div>
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


async function showMovieDetails(movie, listType) {
    const title = document.getElementById("movie-title");
    const image = document.getElementById("movie-image");
    const description = document.getElementById("movie-description");
    const info = document.getElementById("movie-info");
    const watchlistBtn = document.getElementById("add-watchlist");
    const watchlistBtnModal = document.getElementById("add-watchlist-modal");
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
        const watchlistResponse = await fetchWithAuth(`${BASE_URL}/lists?type=watchlist`, { credentials: "include" });
        const watchlistData = await watchlistResponse.json();
        const isInWatchlist = watchlistData.status === "success" && watchlistData.data.some(m => m.movieId === movie.movieId);
        
        const watchedResponse = await fetchWithAuth(`${BASE_URL}/lists?type=watched`, { credentials: "include" });
        const watchedData = await watchedResponse.json();
        const isWatched = watchedData.status === "success" && watchedData.data.some(m => m.movieId === movie.movieId);

        const droppedResponse = await fetchWithAuth(`${BASE_URL}/lists?type=dropped`, { credentials: "include" });
        const droppedData = await droppedResponse.json();
        const isDropped = droppedData.status === "success" && droppedData.data.some(m => m.movieId === movie.movieId);

        const favoritesResponse = await fetchWithAuth(`${BASE_URL}/lists?type=favorites`, { credentials: "include" });
        const favoritesData = await favoritesResponse.json();
        const isFavorite = favoritesData.status === "success" && favoritesData.data.some(m => m.movieId === movie.movieId);

        watchlistBtn.style.color = isInWatchlist ? '#ffd700' : 'white';
        watchlistBtn.onclick = (e) => toggleWatchlist(e, movie.movieId, isInWatchlist, listType);

        watchedBtn.style.color = isWatched ? '#ffd700' : 'white';
        watchedBtn.onclick = (e) => toggleList(e, movie.movieId, "watched", isWatched, listType);

        droppedBtn.style.color = isDropped ? '#ffd700' : 'white';
        droppedBtn.onclick = (e) => toggleList(e, movie.movieId, "dropped", isDropped, listType);

        favoriteBtn.style.color = isFavorite ? '#ffd700' : 'white';
        favoriteBtn.onclick = (e) => toggleFavorite(e, movie.movieId, isFavorite, listType);

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
            reviewsList.innerHTML = '<p class="">No reviews yet.</p>';
        }
    } catch (error) {
        console.error("Fetch reviews error:", error);
        reviewsList.innerHTML = '<p class="">Error loading reviews.</p>';
        showToast("Error loading reviews", "danger");
    }
}

function renderReviews(reviews, reviewsList) {
    reviewsList.innerHTML = "<h6>Reviews:</h6>";
    if (!reviews || reviews.length === 0) {
        reviewsList.innerHTML += '<p class="">No reviews yet.</p>';
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
                    <p class="">${review.comment || "No comment"}</p>
                    <small class="">${new Date(review.reviewDate).toLocaleDateString()}</small>
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

async function toggleWatchlist(event, movieId, isInWatchlist, listType) {
    event.stopPropagation(); // Prevent modal trigger
    try {
        const method = isInWatchlist ? "DELETE" : "POST";
        const response = await fetchWithAuth(`${BASE_URL}/lists?movie_id=${movieId}&type=watchlist`, { method });
        const data = await response.json();
        if (data.status === "success") {
            const watchlistBtn = document.getElementById("add-watchlist");
            watchlistBtn.style.color = isInWatchlist ? 'white' : '#ffd700';
            watchlistBtn.onclick = (e) => toggleWatchlist(e, movieId, !isInWatchlist, listType);
            if (listType === "watchlist") {
                fetchUserList("watchlist");
            } else if (listType === "watched") {
                fetchUserList("watched");
            } else if (listType === "dropped") {
                fetchUserList("dropped");
            } else if (listType === "favorites") {
                fetchUserList("favorites");
            } else {
                fetchMoviesUser();
            }
            showToast(data.message, "success");
        } else {
            showToast(data.message || "Failed to update watchlist", "danger");
        }
    } catch (error) {
        console.error("Toggle watchlist error:", error);
        showToast("Failed to update watchlist", "danger");
    }
}

async function toggleList(event, movieId, listType, isInList, listType2) {
    event.stopPropagation(); // Prevent modal trigger
    try {
        const method = isInList ? "DELETE" : "POST";
        const response = await fetchWithAuth(`${BASE_URL}/lists?movie_id=${movieId}&type=${listType}`, { method });
        const data = await response.json();
        if (data.status === "success") {
            const btn = listType === "watched" ? document.getElementById("add-watched") : document.getElementById("add-dropped");
            btn.style.color = isInList ? 'white' : '#ffd700';
            btn.onclick = (e) => toggleList(e, movieId, listType, !isInList, listType2);
            if (listType2 === "watchlist") {
                fetchUserList("watchlist");
            } else if (listType2 === "watched") {
                fetchUserList("watched");
            } else if (listType2 === "dropped") {
                fetchUserList("dropped");
            } else if (listType2 === "favorites") {
                fetchUserList("favorites");
            } else {
                fetchMoviesUser();
            }
            showToast(data.message, "success");
        } else {
            showToast(data.message || `Failed to ${isInList ? 'remove from' : 'add to'} ${listType}`, "danger");
        }
    } catch (error) {
        console.error(`Toggle ${listType} error:`, error);
        showToast(`Failed to ${isInList ? 'remove from' : 'add to'} ${listType}`, "danger");
    }
}

async function toggleFavorite(event, movieId, isFavorite, listType) {
    event.stopPropagation(); // Prevent modal trigger
    try {
        const method = isFavorite ? "DELETE" : "POST";
        const response = await fetchWithAuth(`${BASE_URL}/lists?movie_id=${movieId}&type=favorites`, { method });
        const data = await response.json();
        if (data.status === "success") {
            const favoriteBtn = document.getElementById("add-favorite");
            favoriteBtn.style.color = isFavorite ? 'white' : '#ffd700';
            favoriteBtn.onclick = (e) => toggleFavorite(e, movieId, !isFavorite, listType);
            if (listType === "watchlist") {
                fetchUserList("watchlist");
            } else if (listType === "watched") {
                fetchUserList("watched");
            } else if (listType === "dropped") {
                fetchUserList("dropped");
            } else if (listType === "favorites") {
                fetchUserList("favorites");
            } else {
                fetchMoviesUser();
            }
            showToast(data.message, "success");
        } else {
            showToast(data.message || "Failed to update favorites", "danger");
        }
    } catch (error) {
        console.error("Toggle favorite error:", error);
        showToast("Failed to update favorites", "danger");
    }
}

async function fetchUserList(listType) {
    const listsContent = document.getElementById("movies-list");
    try {
        const response = await fetchWithAuth(`${BASE_URL}/lists?type=${listType}`);
        const data = await response.json();
        console.log("List fetch:", data);
        if (data.status === "success") {
            renderMoviesUser(data.data, listType);
        } else {
            listsContent.innerHTML = '<p class="col text-center ">Error fetching list.</p>';
            showToast("Error fetching list", "danger");
        }
    } catch (error) {
        console.error("Fetch list error:", error);
        listsContent.innerHTML = '<p class="col text-center ">Error fetching list.</p>';
        showToast("Error fetching list", "danger");
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
    const searchInput = document.getElementById("search-input");
    const clearSearchBtn = document.getElementById("clear-search");
    if (!searchForm || !searchInput || !clearSearchBtn) return;

    searchInput.addEventListener("input", (e) => {
        clearSearchBtn.style.display = e.target.value ? "block" : "none";
        debouncedSearch(e.target.value.trim());
    });

    // Debounce function to limit API calls
    const debounce = (func, delay) => {
        let timeoutId;
        return (...args) => {
            clearTimeout(timeoutId);
            timeoutId = setTimeout(() => func.apply(null, args), delay);
        };
    };

    // Search handler
    const handleSearch = async (query) => {
        if (query.length < 2) { // Require at least 2 characters
            const isUserPage = window.location.pathname.includes("user.html");
            isUserPage ? fetchMoviesUser() : fetchMovies();
            return;
        }

        if (!query) {
            const isUserPage = window.location.pathname.includes("user.html");
            isUserPage ? fetchMoviesUser() : fetchMovies();
            return;
        }

        try {
            const response = await fetch(`${BASE_URL}/movies/search?q=${encodeURIComponent(query)}`, { credentials: "include" });
            const data = await response.json();
            console.log("Search response:", data);
            if (data.status === "success") {
                const isUserPage = window.location.pathname.includes("user.html");
                isUserPage ? renderMoviesUser(data.data) : renderMovies(data.data);
            } else {
                const moviesList = document.getElementById("movies-list");
                moviesList.innerHTML = '<p class="col text-center ">No movies found.</p>';
                showToast("No movies found", "warning");
            }
        } catch (error) {
            console.error("Search error:", error);
            const moviesList = document.getElementById("movies-list");
            moviesList.innerHTML = '<p class="col text-center ">Error searching movies.</p>';
            showToast("Error searching movies", "danger");
        }
    };

    // Debounced search function (waits 300ms after typing stops)
    const debouncedSearch = debounce(handleSearch, 0); // Slower: 500ms
    // or

    // Listen for input events
    searchInput.addEventListener("input", (e) => {
        const query = e.target.value.trim();
        debouncedSearch(query);
    });

    // Clear search button
    clearSearchBtn.addEventListener("click", () => {
        searchInput.value = "";
        const isUserPage = window.location.pathname.includes("user.html");
        isUserPage ? fetchMoviesUser() : fetchMovies();
    });

    // Optional: Keep form submission prevention
    searchForm.addEventListener("submit", (e) => {
        e.preventDefault();
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

function getAverageRating(movie) {
        const averageRating = movie.averageRating || 0;
    const reviewCount = movie.reviewCount || 0;
    
    if (reviewCount === 0) {
        return "No ratings yet";
    }
    
    const stars = getStarRating(averageRating);
    return `${stars}`;
}
// Helper function (unchanged)
function getStarRating(rating) {
    const fullStar = '<i class="fas fa-star star-rating"></i>';
    const halfStar = '<i class="fas fa-star-half-alt star-rating"></i>';
    const emptyStar = '<i class="far fa-star star-rating"></i>';
    let stars = '';
    
    for (let i = 1; i <= 5; i++) {
        if (rating >= i) {
            stars += fullStar;
        } else if (rating >= i - 0.5) {
            stars += halfStar;
        } else {
            stars += emptyStar;
        }
    }
    return stars;
}

function getCurrentListType() {
    const path = window.location.pathname;
    if (path.includes("watchlist.html")) return "watchlist";
    if (path.includes("watched.html")) return "watched";
    if (path.includes("dropped.html")) return "dropped";
    if (path.includes("favorites.html")) return "favorites";
    return null;
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