const BASE_URL = "http://localhost:8080/Movies_Review";

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