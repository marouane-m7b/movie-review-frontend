function setupAuthModal() {
    const loginBtn = document.getElementById("login-btn");
    const signupBtn = document.getElementById("signup-btn");
    const authModal = new bootstrap.Modal(document.getElementById("auth-modal"));
    const authForm = document.getElementById("auth-form");
    const authTitle = document.getElementById("auth-modal-title");
    const authSubmit = document.getElementById("auth-submit");
    const toggleAuth = document.getElementById("toggle-auth");
    const emailField = document.getElementById("email-field");
    const csrfTokenInput = document.getElementById("csrf-token");

    let isLoginMode = true;

    if (loginBtn) {
        loginBtn.addEventListener("click", () => {
            isLoginMode = true;
            updateAuthModal();
            fetchCsrfToken().then(() => authModal.show());
        });
    }

    if (signupBtn) {
        signupBtn.addEventListener("click", () => {
            isLoginMode = false;
            updateAuthModal();
            fetchCsrfToken().then(() => authModal.show());
        });
    }

    toggleAuth.addEventListener("click", (e) => {
        e.preventDefault();
        isLoginMode = !isLoginMode;
        updateAuthModal();
    });

    authForm.addEventListener("submit", async (e) => {
        e.preventDefault();
        const username = document.getElementById("username").value;
        const password = document.getElementById("password").value;
        const email = document.getElementById("email").value;
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
            if (data.status === "success" || (data.message && data.message.includes("successful"))) {
                if (isLoginMode) {
                    setToken(data.token);
                    authModal.hide();
                    checkUserRoleAndRedirect();
                } else {
                    alert("Signup successful! Please login.");
                    isLoginMode = true;
                    updateAuthModal();
                }
            } else {
                alert(data.message);
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
        } catch (error) {
            console.error("Error fetching CSRF token:", error);
        }
    }
}

async function checkUserRoleAndRedirect() {
    const token = getToken();
    if (!token) return;

    try {
        const response = await fetch(`${BASE_URL}/profile`, {
            headers: { "Authorization": `Bearer ${token}` },
            credentials: "include"
        });
        const data = await response.json();
        if (data.status === "success") {
            if (data.data.isAdmin) {
                window.location.href = "pages/admin.html"; // Correct path from src/
            } else {
                window.location.href = "pages/user.html"; // Correct path from src/
            }
        } else {
            clearToken();
            window.location.href = "index.html"; // Back to landing if profile fails
        }
    } catch (error) {
        console.error("Error checking role:", error);
        clearToken();
        window.location.href = "index.html"; // Fallback
    }
}

function setupLogout() {
    const logoutBtn = document.getElementById("logout-btn");
    if (!logoutBtn) return;

    logoutBtn.addEventListener("click", async () => {
        try {
            const response = await fetchWithAuth(`${BASE_URL}/logout`, {
                method: "POST"
            });
            const data = await response.json();
            if (data.status === "success") {
                clearToken();
                window.location.href = "../index.html"; // Correct path from pages/
            } else {
                alert(data.message);
            }
        } catch (error) {
            console.error("Logout error:", error);
            alert("Failed to logout.");
            clearToken();
            window.location.href = "../index.html"; // Fallback
        }
    });
}