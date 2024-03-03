document.getElementById("loginForm").addEventListener("submit", function(event) {
    event.preventDefault(); // Prevent default form submission

    // Serialize form data to JSON
    var formData = {
        email: document.getElementById("email").value,
        password: document.getElementById("password").value
    };

    // Send form data to servlet using AJAX
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "LoginServlet");
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                // Handle successful response from servlet
                console.log(xhr.responseText);
            } else {
                // Handle error response from servlet
                console.error(xhr.status);
            }
        }
    };
    xhr.send(JSON.stringify(formData));
});
