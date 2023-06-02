const msnry = new Masonry(document.getElementById("container"), {
    itemSelector: ".item",
    columnWidth: ".item",
    gutter: ".gutterSizer",
    percentPosition: !0
});

infiniteScroll({
    container: "#container",
    item: ".item",
    next: ".next",
    prev: ".prev",
    prevLoader: ".prevLoader",
    pushHistory: true,
    nextCallback: (newElement) => {
        msnry.appended(newElement)
    },
    prevCallback: (newElement) => {
        msnry.prepended(newElement)
    },
    onLoadFinish: () => {
        msnry.layout()
    }
}),

window.addEventListener("load", () => {
    msnry.layout()
})