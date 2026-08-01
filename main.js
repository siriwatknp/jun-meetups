// Scroll-reveal. Purely progressive: without JS, everything is already visible.
(function () {
  var reduce = window.matchMedia("(prefers-reduced-motion: reduce)").matches;
  if (reduce) return;

  var targets = document.querySelectorAll(
    ".section-head, .stat, .edition, .foot-inner"
  );
  targets.forEach(function (el, i) {
    el.classList.add("reveal");
    el.style.transitionDelay = (i % 3) * 80 + "ms";
  });

  var io = new IntersectionObserver(
    function (entries) {
      entries.forEach(function (e) {
        if (e.isIntersecting) {
          e.target.classList.add("in");
          io.unobserve(e.target);
        }
      });
    },
    { threshold: 0.15, rootMargin: "0px 0px -8% 0px" }
  );
  targets.forEach(function (el) { io.observe(el); });
})();
