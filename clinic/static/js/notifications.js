const userId = document.body.getAttribute('data-user-id');

if (userId) {
    const socket = new WebSocket(`ws://${window.location.host}/ws/notifications/?user_id=${userId}`);

    socket.onopen = function () {
        console.log("WebSocket connected.");
    };

    socket.onmessage = function (event) {
        const data = JSON.parse(event.data);
        console.log("Notification received:", data);

        const popup = document.getElementById("notificationPopup");
        const messageElement = document.getElementById("notificationMessage");

        if (popup && messageElement) {
            messageElement.textContent = data.message;
            popup.classList.remove("hidden");

            setTimeout(() => {
                popup.classList.add("hidden");
            }, 5000);
        }
    };

    socket.onclose = function () {
        console.log("WebSocket closed.");
    };

    socket.onerror = function (error) {
        console.error("WebSocket error:", error);
    };
}
