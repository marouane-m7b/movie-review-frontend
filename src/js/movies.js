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
    const reviewForm = document.getElementById("submit-review-form");
    const editReviewForm = document.getElementById("edit-review-form-inner");

    title.textContent = movie.title;
    image.src = movie.imageUri || "https://via.placeholder.com/300x300";
    description.textContent = movie.description || "No description available";
    info.textContent = `Year: ${movie.releaseYear} | Genre: ${movie.genre || "N/A"}`;

    const token = getToken();
    if (token) {
        watchlistBtn.onclick = () => addToList(movie.movieId, "watchlist");
        watchedBtn.onclick = () => addToList(movie.movieId, "watched");
        droppedBtn.onclick = () => addToList(movie.movieId, "dropped");
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
        reviewItem.innerHTML = `
            <p><strong>${review.username || "Anonymous"}:</strong> ${review.rating} ★</p>
            <p class="text-muted">${review.comment || "No comment"}</p>
            <small class="text-muted">${new Date(review.reviewDate).toLocaleDateString()}</small>
            ${canEdit ? `<button class="btn btn-outline-primary btn-sm mt-2" onclick="editReview(${review.reviewId}, ${review.rating}, '${encodeURIComponent(review.comment || '')}')">Edit</button>` : ""}
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
    if (!searchForm) return;

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
                const isUserPage = window.location.pathname.includes("user.html") ? true : false;
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
}