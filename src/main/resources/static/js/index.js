function cardHoverIn(element) {
    element.style.transform = "scale(" + 1.1 + ")";
    let title = element.querySelector("#title");
    title.classList.remove("invisible");
}
function cardHoverOut(element) {
    let title = element.querySelector("#title");
    let subtext = element.querySelector("#subtext");
    element.style.transform = "scale(" + 1 + ")";

    title.classList.add("invisible");
}