const BASE_URL = "http://localhost:8080/Movies_Review";
const BASE_PATH = "";

function getToken() {
    return localStorage.getItem("token");
}

function setToken(token) {
    localStorage.setItem("token", token);
}

function clearToken() {
    localStorage.removeItem("token");
}

async function fetchWithAuth(url, options = {}) {
    const token = getToken();
    options.headers = {
        ...options.headers,
        "Authorization": `Bearer ${token}`,
        "Content-Type": "application/x-www-form-urlencoded"
    };
    options.credentials = "include";
    return fetch(url, options);
}

// Parse user ID from token (simple base64 decode of payload)
function getCurrentUserId() {
    const token = getToken();
    if (!token) return null;
    try {
        const payload = token.split('.')[1]; // Get payload part of JWT
        const decoded = atob(payload); // Base64 decode
        const parsed = JSON.parse(decoded);
        console.log("Decoded token payload:", parsed); // Debug
        return parsed.user_id; // Assuming "user_id" is the key in your token
    } catch (error) {
        console.error("Error decoding token:", error);
        return null;
    }
}