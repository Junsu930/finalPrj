/*
Infinite Scroll v 1.0.6
https://github.com/marshall-ku/Infinite-Scroll
Released under the MIT License.
by Marshall K
*/

function infiniteScroll({
    container,
    next,
    prev,
    item,
    nextButton,
    prevButton,
    nextLoader,
    prevLoader,
    pushHistory,
    detectLoad,
    onLoadFinish,
    nextCallback,
    prevCallback,
    autoPrev,
}) {
    const windowHeight = window.innerHeight;
    const containerElem = document.querySelector(container);
    const nextElem = document.querySelector(next);
    const prevElem = document.querySelector(prev);
    const loaderElem = {
        next: nextLoader && document.querySelector(nextLoader),
        prev: prevLoader && document.querySelector(prevLoader),
    };
    const prevArray = [];
    const reveal = "reveal";
    let loadingNext = false;
    let loadingPrev = false;
    let SCROLLY = window.scrollY || window.pageYOffset;
    let TICKING = false;

    function init() {
        if (!container || !next || !item) {
            throw "Initial Elements are Missing!";
        }
        nextButton && (nextButton = document.querySelector(nextButton));
        prevButton && (prevButton = document.querySelector(prevButton));
        nextElem === null
            ? noMoreNext()
            : "" === nextElem.getAttribute("href") && noMoreNext();
        prevElem === null
            ? noMorePrev()
            : "" === prevElem.getAttribute("href") && noMorePrev();
        detectLoad === undefined && (detectLoad = true);
    }

    function noMoreNext() {
        nextElem.classList.add("done");
        nextElem.removeAttribute("href");
        nextLoader && (loaderElem.next.style.display = "none");
        nextButton && (nextButton.style.display = "none");
    }

    function noMorePrev() {
        prevElem.classList.add("done");
        prevElem.removeAttribute("href");
        prevLoader && (loaderElem.prev.style.display = "none");
        prevButton && (prevButton.style.display = "none");
    }

    function nextPage() {
        const d = document.querySelector(next);

        if (null === d || true === loadingNext || d.classList.contains("done"))
            return;

        let imgLength = 0;
        let loadedImg = 0;
        const uri = d.href;
        const loadEnd = () => {
            if (imgLength === loadedImg) {
                pushHistory && history.pushState(null, null, uri);
                nextLoader && loaderElem.next.classList.remove(reveal);
                nextButton &&
                    !nextElem.classList.contains("done") &&
                    (nextButton.style.display = "");
                loadingNext = false;
                onLoadFinish && onLoadFinish();
            }
        };

        loadingNext = true;
        nextLoader && loaderElem.next.classList.add(reveal);
        nextButton && (nextButton.style.display = "none");

        fetch(uri)
            .then((response) => {
                const status = response.status;
                if (status === 200) {
                    return response.text();
                } else if (status === 404) {
                    noMoreNext();
                } else {
                    return;
                }
            })
            .then((response) => {
                const parser = new DOMParser().parseFromString(
                    response,
                    "text/html"
                );
                const items = parser.querySelectorAll(item);

                if (
                    null === parser.querySelector(next) ||
                    "" === parser.querySelector(next).getAttribute("href")
                ) {
                    noMoreNext();
                } else {
                    d.href = parser.querySelector(next).href;
                }

                items.forEach((element) => {
                    if (detectLoad) {
                        element.querySelectorAll("img").forEach((img) => {
                            imgLength++;
                            img.addEventListener("load", () => {
                                loadedImg++;
                                loadEnd();
                            });
                        });
                    }
                    containerElem.append(element);
                    nextCallback && nextCallback(element);
                });

                if (!detectLoad) {
                    loadingNext = false;
                    nextLoader && loaderElem.next.classList.remove(reveal);
                    nextButton && (nextButton.style.display = "");
                }
            })
            .catch((err) => {
                console.log(err);
            });
    }

    function prevPage() {
        const d = document.querySelector(prev);

        if (null === d || true === loadingPrev || d.classList.contains("done"))
            return;

        let isFirstPage = false;
        let imgLength = 0;
        let loadedImg = 0;
        const uri = d.href;
        const loadEnd = () => {
            if (imgLength === loadedImg) {
                prevLoader && loaderElem.prev.classList.remove(reveal);
                loadingPrev = false;
                prevButton &&
                    !prevElem.classList.contains("done") &&
                    (prevButton.style.display = "");
                onLoadFinish && onLoadFinish();
            }
        };

        loadingPrev = true;
        prevLoader && loaderElem.prev.classList.add(reveal);
        prevButton && (prevButton.style.display = "none");

        fetch(uri)
            .then((response) => {
                const status = response.status;
                if (status === 200) {
                    return response.text();
                } else if (status === 404) {
                    isFirstPage = true;
                    noMorePrev();

                    return false;
                } else {
                    return false;
                }
            })
            .then((response) => {
                const parser = new DOMParser().parseFromString(
                    response,
                    "text/html"
                );
                const items = parser.querySelectorAll(item);

                if (autoPrev && !isFirstPage) {
                    isFirstPage =
                        null === parser.querySelector(prev)
                            ? true
                            : parser
                                  .querySelector(prev)
                                  .getAttribute("href") === "";
                }

                if (
                    null === parser.querySelector(prev) ||
                    "" === parser.querySelector(prev).getAttribute("href")
                ) {
                    noMorePrev();
                } else {
                    d.href = parser.querySelector(prev).href;
                }

                if (autoPrev) {
                    if (isFirstPage) {
                        noMorePrev();
                    } else {
                        d.href = parser.querySelector(prev).href;
                    }

                    parser
                        .querySelectorAll(item)
                        .reverse()
                        .forEach((element) => {
                            prevArray.push(element);
                        });

                    if (isFirstPage) {
                        prevArray.forEach((element) => {
                            if (detectLoad) {
                                element
                                    .querySelectorAll("img")
                                    .forEach((img) => {
                                        imgLength++;
                                        img.addEventListener("load", () => {
                                            loadedImg++;
                                            loadEnd();
                                        });
                                    });
                            }
                            containerElem.prepend(element),
                                prevCallback && prevCallback(element);
                        });
                    } else {
                        loadingPrev = false;
                        prevPage();
                    }
                } else {
                    items.reverse().forEach((element) => {
                        if (detectLoad) {
                            element.querySelectorAll("img").forEach((img) => {
                                imgLength++;
                                img.addEventListener("load", () => {
                                    loadedImg++;
                                    loadEnd();
                                });
                            });
                        }
                        containerElem.prepend(element),
                            prevCallback && prevCallback(element);
                    });

                    if (!detectLoad) {
                        loadingPrev = false;
                        prevLoader && loaderElem.prev.classList.remove(reveal);
                    }
                }
            })
            .catch((err) => {
                console.log(err);
            });
    }

    function handlePageLoad() {
        const offsetTop = containerElem.offsetTop;
        !nextButton &&
            null !== nextElem &&
            "" !== nextElem.getAttribute("href") &&
            !loadingNext &&
            SCROLLY >=
                offsetTop + containerElem.scrollHeight - windowHeight - 500 &&
            nextPage();
        !prevButton &&
            null !== prevElem &&
            "" !== prevElem.getAttribute("href") &&
            !loadingPrev &&
            SCROLLY <= offsetTop + 500 &&
            prevPage();
    }

    init();
    !prevButton && autoPrev && prevPage();
    handlePageLoad();

    window.addEventListener(
        "scroll",
        () => {
            if (!TICKING) {
                TICKING = true;
                window.requestAnimationFrame(() => {
                    SCROLLY = window.scrollY || window.pageYOffset;
                    handlePageLoad();
                    TICKING = false;
                });
            }
        },
        { passive: true }
    );

    nextButton &&
        nextButton.addEventListener("click", () => {
            nextPage();
        });

    prevButton &&
        prevButton.addEventListener("click", () => {
            prevPage();
        });
}
