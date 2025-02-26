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

function getCurrentUserId() {
    const token = getToken();
    if (!token) return null;
    try {
        const payload = token.split('.')[1];
        const decoded = atob(payload);
        const parsed = JSON.parse(decoded);
        console.log("Decoded token payload:", parsed);
        return parsed.user_id;
    } catch (error) {
        console.error("Error decoding token:", error);
        return null;
    }
}

function applyTheme() {
    const theme = localStorage.getItem('theme') || 'dark';
    const body = document.body;
    const navbar = document.querySelector('.navbar');
    const cards = document.querySelectorAll('.card');
    const dropdowns = document.querySelectorAll('.dropdown-menu, .dropdown-item');
    const inputs = document.querySelectorAll('.form-control');

    if (theme === 'dark') {
        body.classList.add('bg-dark', 'text-light');
        body.classList.remove('bg-light', 'text-dark');
        navbar.classList.add('navbar-dark', 'bg-dark');
        navbar.classList.remove('navbar-light', 'bg-light');
        cards.forEach(card => {
            card.classList.add('bg-dark', 'text-light');
            card.classList.remove('bg-light', 'text-dark');
        });
        dropdowns.forEach(item => {
            item.classList.add('bg-dark', 'text-light');
            item.classList.remove('bg-light', 'text-dark');
        });
        inputs.forEach(input => {
            input.classList.add('bg-dark', 'text-light', 'border-light');
            input.classList.remove('bg-light', 'text-dark', 'border-dark');
        });
    } else {
        body.classList.add('bg-light', 'text-dark');
        body.classList.remove('bg-dark', 'text-light');
        navbar.classList.add('navbar-light', 'bg-light');
        navbar.classList.remove('navbar-dark', 'bg-dark');
        cards.forEach(card => {
            card.classList.add('bg-light', 'text-dark');
            card.classList.remove('bg-dark', 'text-light');
        });
        dropdowns.forEach(item => {
            item.classList.add('bg-light', 'text-dark');
            item.classList.remove('bg-dark', 'text-light');
        });
        inputs.forEach(input => {
            input.classList.add('bg-light', 'text-dark', 'border-dark');
            input.classList.remove('bg-dark', 'text-light', 'border-light');
        });
    }
}