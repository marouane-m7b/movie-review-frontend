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
    const movieElements = movies.map(movie => {
        const movieCard = document.createElement("div");
        movieCard.className = "col";
        movieCard.innerHTML = `
            <div class="card movie-card">
                <img src="${movie.imageUri || 'https://via.placeholder.com/300x400'}" class="card-img-top" alt="${movie.title}">
                <span class="custom-tooltip">${movie.title}</span>
                <div class="card-body">
                    <div class="actions">
                        <button onclick="requireAuth()" class="btn-icon text-white"><i class="fas fa-eye"></i></button>
                        <button onclick="requireAuth()" class="btn-icon text-white"><i class="fas fa-check"></i></button>
                        <button onclick="requireAuth()" class="btn-icon text-white"><i class="fas fa-times"></i></button>
                    </div>
                </div>
            </div>
        `;
        return movieCard;
    });
    movieElements.forEach(element => moviesList.appendChild(element));
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

        watchlistBtn.innerHTML = `<i class="fas ${isInWatchlist ? 'fa-eye-slash' : 'fa-eye'}"></i>`;
        watchlistBtn.className = `btn-icon text-white ${isInWatchlist ? 'active' : ''}`;
        watchlistBtn.onclick = () => toggleWatchlist(movie.movieId, isInWatchlist);

        watchedBtn.innerHTML = `<i class="fas ${isWatched ? 'fa-check-circle' : 'fa-check'}"></i>`;
        watchedBtn.className = `btn-icon text-white ${isWatched ? 'active' : ''}`;
        watchedBtn.onclick = () => toggleList(movie.movieId, "watched", isWatched);

        droppedBtn.innerHTML = `<i class="fas ${isDropped ? 'fa-times-circle' : 'fa-times'}"></i>`;
        droppedBtn.className = `btn-icon text-white ${isDropped ? 'active' : ''}`;
        droppedBtn.onclick = () => toggleList(movie.movieId, "dropped", isDropped);

        reviewBtn.onclick = () => {};
        setupReviewForm(movie.movieId);
        setupEditReviewForm(movie.movieId);
    } else {
        watchlistBtn.onclick = () => requireAuth();
        watchedBtn.onclick = () => requireAuth();
        droppedBtn.onclick = () => requireAuth();
        reviewBtn.onclick = () => requireAuth();
        reviewForm.style.display = "none";
        editReviewForm.style.display = "none";
    }

    await refreshReviews(movie.movieId, reviewsList);
    detailsModal.show();
}

async function refreshReviews(movieId, reviewsList) {
    try {
        const response = await fetch(`${BASE_URL}/reviews?movie_id=${movieId}`, {
            credentials: "include"
        });
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
            <p><strong>${review.username || "Anonymous"}:</strong> ${stars}</p>
            <p class="text-muted">${review.comment || "No comment"}</p>
            <small class="text-muted">${new Date(review.reviewDate).toLocaleDateString()}</small>
            ${canEdit ? `<button class="btn btn-outline-primary btn-sm mt-2" onclick="editReview(${review.reviewId}, ${review.rating}, '${encodeURIComponent(review.comment || '')}')"><i class="fas fa-edit"></i> Edit</button>` : ""}
        `;
        reviewsList.appendChild(reviewItem);
    });
}

function requireAuth() {
    const authModal = new bootstrap.Modal(document.getElementById("auth-modal"));
    authModal.show();
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

async function toggleWatchlist(movieId, isInWatchlist) {
    try {
        const method = isInWatchlist ? "DELETE" : "POST";
        const response = await fetchWithAuth(`${BASE_URL}/lists?movie_id=${movieId}&type=watchlist`, {
            method: method
        });
        const data = await response.json();
        if (data.status === "success") {
            const watchlistBtn = document.getElementById("add-watchlist");
            watchlistBtn.innerHTML = `<i class="fas ${isInWatchlist ? 'fa-eye' : 'fa-eye-slash'}"></i>`;
            watchlistBtn.className = `btn-icon text-white ${isInWatchlist ? '' : 'active'}`;
            watchlistBtn.onclick = () => toggleWatchlist(movieId, !isInWatchlist);
            alert(data.message);
        } else {
            alert(data.message || "Failed to update watchlist.");
        }
    } catch (error) {
        console.error("Toggle watchlist error:", error);
        alert("Failed to update watchlist.");
    }
}

async function toggleList(movieId, listType, isInList) {
    try {
        const method = isInList ? "DELETE" : "POST";
        const response = await fetchWithAuth(`${BASE_URL}/lists?movie_id=${movieId}&type=${listType}`, {
            method: method
        });
        const data = await response.json();
        if (data.status === "success") {
            const btn = listType === "watched" ? document.getElementById("add-watched") : document.getElementById("add-dropped");
            btn.innerHTML = `<i class="fas ${listType === 'watched' ? (isInList ? 'fa-check' : 'fa-check-circle') : (isInList ? 'fa-times' : 'fa-times-circle')}"></i>`;
            btn.className = `btn-icon text-white ${isInList ? '' : 'active'}`;
            btn.onclick = () => toggleList(movieId, listType, !isInList);
            alert(data.message);
        } else {
            alert(data.message || `Failed to ${isInList ? 'remove from' : 'add to'} ${listType}.`);
        }
    } catch (error) {
        console.error(`Toggle ${listType} error:`, error);
        alert(`Failed to ${isInList ? 'remove from' : 'add to'} ${listType}.`);
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
                alert("Review submitted successfully!");
                await refreshReviews(movieId, reviewsList);
                newForm.reset();
                document.getElementById("review-form").classList.remove("show");
            } else {
                alert(data.message || "Failed to submit review.");
            }
        } catch (error) {
            console.error("Submit review error:", error);
            alert("Failed to submit review.");
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
                alert("Review updated successfully!");
                await refreshReviews(movieId, reviewsList);
                newEditForm.reset();
                document.getElementById("edit-review-form").classList.remove("show");
            } else {
                alert(data.message || "Failed to update review.");
            }
        } catch (error) {
            console.error("Edit review error:", error);
            alert("Failed to update review.");
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
            const response = await fetch(`${BASE_URL}/movies/search?q=${encodeURIComponent(query)}`, {
                credentials: "include"
            });
            const data = await response.json();
            console.log("Search response:", data);
            if (data.status === "success") {
                const isUserPage = window.location.pathname.includes("user.html");
                isUserPage ? renderMoviesUser(data.data) : renderMovies(data.data);
            } else {
                const moviesList = document.getElementById("movies-list");
                moviesList.innerHTML = '<p class="col text-center text-muted">No movies found.</p>';
            }
        } catch (error) {
            console.error("Search error:", error);
            const moviesList = document.getElementById("movies-list");
            moviesList.innerHTML = '<p class="col text-center text-muted">Error searching movies.</p>';
        }
    });

    clearSearchBtn.addEventListener("click", () => {
        document.getElementById("search-input").value = "";
        const isUserPage = window.location.pathname.includes("user.html");
        isUserPage ? fetchMoviesUser() : fetchMovies();
    });
}