function setupAuthModal() {
    const loginBtn = document.getElementById("login-btn");
    const signupBtn = document.getElementById("signup-btn");
    const authModal = new bootstrap.Modal(document.getElementById("auth-modal"));
    const authForm = document.getElementById("auth-form");
    const authTitle = document.getElementById("auth-modal-title");
    const authSubmit = document.getElementById("auth-submit");
    const toggleAuth = document.getElementById("toggle-auth");
    const emailField = document.getElementById("auth-email-field");
    const csrfTokenInput = document.getElementById("csrf-token");

    let isLoginMode = true;

    loginBtn.addEventListener("click", () => {
        isLoginMode = true;
        updateAuthModal();
        fetchCsrfToken().then(() => authModal.show());
    });

    signupBtn.addEventListener("click", () => {
        isLoginMode = false;
        updateAuthModal();
        fetchCsrfToken().then(() => authModal.show());
    });

    toggleAuth.addEventListener("click", (e) => {
        e.preventDefault();
        isLoginMode = !isLoginMode;
        updateAuthModal();
    });

    authForm.addEventListener("submit", async (e) => {
        e.preventDefault();
        const username = document.getElementById("auth-username").value;
        const password = document.getElementById("auth-password").value;
        const email = document.getElementById("auth-email").value;
        const csrfToken = csrfTokenInput.value;

        const url = isLoginMode ? `${BASE_URL}/login` : `${BASE_URL}/register`;
        const body = isLoginMode
            ? `username=${encodeURIComponent(username)}&password=${encodeURIComponent(password)}&csrf_token=${encodeURIComponent(csrfToken)}`
            : `username=${encodeURIComponent(username)}&password=${encodeURIComponent(password)}&email=${encodeURIComponent(email)}`;

        try {
            const response = await fetch(url, {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: body,
                credentials: "include"
            });
            const data = await response.json();
            console.log("Auth response:", data);
            if (data.status === "success") {
                if (isLoginMode) {
                    const token = data.token;
                    console.log("Token from response:", token);
                    setToken(token);
                    console.log("Token in localStorage after set:", getToken());
                    authModal.hide();
                    await checkUserRoleAndRedirect();
                    console.log("Redirect should have happened");
                } else {
                    alert("Signup successful! Please login.");
                    isLoginMode = true;
                    updateAuthModal();
                }
            } else {
                alert(data.message || "Authentication failed.");
            }
        } catch (error) {
            console.error(`${isLoginMode ? "Login" : "Signup"} error:`, error);
            alert(`An error occurred during ${isLoginMode ? "login" : "signup"}.`);
        }
    });

    function updateAuthModal() {
        authTitle.textContent = isLoginMode ? "Login" : "Signup";
        authSubmit.textContent = isLoginMode ? "Login" : "Signup";
        toggleAuth.textContent = isLoginMode ? "Need an account? Signup" : "Already have an account? Login";
        emailField.classList.toggle("d-none", isLoginMode);
    }

    async function fetchCsrfToken() {
        try {
            const response = await fetch(`${BASE_URL}/login`, {
                credentials: "include"
            });
            const data = await response.json();
            csrfTokenInput.value = data.csrfToken;
            console.log("CSRF token fetched:", data.csrfToken);
        } catch (error) {
            console.error("Error fetching CSRF token:", error);
        }
    }
}

async function checkUserRoleAndRedirect() {
    const token = getToken();
    if (!token) {
        console.log("No token found, staying on index.");
        return;
    }

    try {
        const response = await fetch(`${BASE_URL}/profile`, {
            headers: { "Authorization": `Bearer ${token}` },
            credentials: "include"
        });
        const data = await response.json();
        console.log("Profile response:", data);
        if (data.status === "success") {
            const redirectUrl = data.data.isAdmin ? "/pages/admin.html" : "/pages/user.html";
            console.log("Redirecting to:", redirectUrl);
            window.location.href = redirectUrl;
        } else {
            console.log("Profile fetch failed, clearing token");
            clearToken();
            window.location.href = "/index.html";
        }
    } catch (error) {
        console.error("Error checking role:", error);
        clearToken();
        window.location.href = "/index.html";
    }
}

function setupLogout() {
    const logoutBtn = document.getElementById("logout-btn");
    if (!logoutBtn) {
        console.log("Logout button not found on this page."); // Debug
        return;
    }

    logoutBtn.addEventListener("click", async () => {
        console.log("Logout button clicked"); // Debug
        try {
            const response = await fetchWithAuth(`${BASE_URL}/logout`, {
                method: "POST"
            });
            const data = await response.json();
            console.log("Logout response:", data); // Debug
            if (data.status === "success") {
                clearToken();
                console.log("Token cleared, redirecting to index"); // Debug
                window.location.href = "/index.html"; // Absolute path
            } else {
                alert(data.message || "Logout failed.");
            }
        } catch (error) {
            console.error("Logout error:", error);
            alert("Failed to logout.");
            clearToken();
            window.location.href = "/index.html";
        }
    });
}