document.addEventListener("DOMContentLoaded", function() {
    var randomOptionButton = document.getElementById("random-option");
    randomOptionButton.addEventListener("click", function() {
        var options = @query.options.to_json;
        var randomIndex = Math.floor(Math.random() * options.length);
        var randomOption = options[randomIndex];
        alert(randomOption.text);
    });
});