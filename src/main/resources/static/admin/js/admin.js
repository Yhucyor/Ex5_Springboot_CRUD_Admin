document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll("[data-password-toggle]").forEach((button) => {
        const input = button.closest(".input-shell")?.querySelector("input");
        if (!input) return;

        button.addEventListener("click", () => {
            const showing = input.type === "text";
            input.type = showing ? "password" : "text";
            button.textContent = showing ? "◉" : "⊘";
            button.setAttribute("aria-label", showing ? "Show password" : "Hide password");
        });
    });

    document.querySelectorAll("[data-file-input]").forEach((input) => {
        const zone = input.closest("[data-upload-zone]");
        const form = input.closest("form");
        const label = zone?.querySelector("[data-file-label]");
        const preview = form?.querySelector("[data-image-preview]");
        const fallback = form?.querySelector("[data-preview-fallback]");
        let previewUrl;

        const updateFile = () => {
            const file = input.files?.[0];
            if (!file) return;

            const maxSize = Number(input.dataset.maxSize || 0);
            const validType = ["image/png", "image/jpeg", "image/webp"].includes(file.type);
            if (!validType || (maxSize && file.size > maxSize)) {
                input.value = "";
                window.alert(!validType
                    ? "Please choose a PNG, JPG, JPEG, or WEBP image."
                    : "Image size must not exceed 2MB.");
                return;
            }

            if (label) label.textContent = file.name;
            if (preview) {
                if (previewUrl) URL.revokeObjectURL(previewUrl);
                previewUrl = URL.createObjectURL(file);
                preview.src = previewUrl;
                preview.hidden = false;
            }
            if (fallback) fallback.hidden = true;
        };

        input.addEventListener("change", updateFile);

        ["dragenter", "dragover"].forEach((eventName) => {
            zone?.addEventListener(eventName, (event) => {
                event.preventDefault();
                zone.classList.add("drag-over");
            });
        });

        ["dragleave", "drop"].forEach((eventName) => {
            zone?.addEventListener(eventName, (event) => {
                event.preventDefault();
                zone.classList.remove("drag-over");
            });
        });

        zone?.addEventListener("drop", (event) => {
            const files = event.dataTransfer?.files;
            if (!files?.length) return;
            input.files = files;
            updateFile();
        });
    });
});
