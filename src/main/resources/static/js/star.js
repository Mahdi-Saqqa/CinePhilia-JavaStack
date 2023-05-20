const stars = document.querySelectorAll('.rating-stars a');


stars.forEach(star => {
    star.addEventListener('click', () => {
        const rating = star.getAttribute('data-rating');
        setRating(rating);
    });
});

function setRating(rating) {
    rating= parseInt(rating);
    stars.forEach(star => {
        const starRating = star.getAttribute('data-rating');
        if (starRating <= rating) {
            star.classList.add('bi-star-fill');
            star.classList.add('text-warning');
            star.classList.remove('bi-star');
        } else {
            star.classList.add('bi-star');
            star.classList.remove('text-warning');
            star.classList.remove('bi-star-fill');
        }
    });
}

function createReviewBox(elem) {

    var reviewBoxContainer = document.getElementById("reviewBoxContainer");

    // Create the review box div
    var reviewBoxDiv = document.createElement("div");
    reviewBoxDiv.classList.add("review-box");

    // Create the review input field
    var reviewInput = document.createElement("textarea");
    reviewInput.classList.add("form-control");
    reviewInput.setAttribute("rows", "4");
    reviewInput.setAttribute("placeholder", "Write your review...");

    // Create the submit button
    var submitButton = document.createElement("button");
    submitButton.classList.add("btn", "btn-primary");
    submitButton.textContent = "Submit Review";

    // Append the input field and submit button to the review box div
    reviewBoxDiv.appendChild(reviewInput);
    reviewBoxDiv.appendChild(submitButton);

    // Append the review box div to the container
    reviewBoxContainer.appendChild(reviewBoxDiv);
    elem.remove();
}