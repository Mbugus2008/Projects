// Please see documentation at https://learn.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

(() => {
    const storageKey = 'matatu-dashboard-theme';

    const getPreferredTheme = () => {
        const storedTheme = localStorage.getItem(storageKey);
        if (storedTheme === 'dark' || storedTheme === 'light') {
            return storedTheme;
        }

        return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
    };

    const applyTheme = theme => {
        document.body.setAttribute('data-theme', theme);
    };

    const toggleTheme = () => {
        const nextTheme = document.body.getAttribute('data-theme') === 'dark' ? 'light' : 'dark';
        localStorage.setItem(storageKey, nextTheme);
        applyTheme(nextTheme);
    };

    document.addEventListener('DOMContentLoaded', () => {
        applyTheme(getPreferredTheme());

        const toggleButton = document.querySelector('[data-theme-toggle]');
        if (!toggleButton) {
            return;
        }

        toggleButton.addEventListener('click', toggleTheme);
    });
})();
