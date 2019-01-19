
    $("#menu-close").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
        $('.overlay').toggleClass("active");
    });
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
        $('.overlay').toggleClass("active");
    });
    
    $('.overlay').on('click', function () {
        $("#sidebar-wrapper").toggleClass("active");
        $('.overlay').toggleClass("active");
    });
    
    var fixed = false;
    $(document).scroll(function() {
        if ($(this).scrollTop() > 250) {
            if (!fixed) {
                fixed = true;
                $("#to-top").show("slow", function() {
                    $("#to-top").css({
                        position: "fixed",
                        display: "block"
                    });
                });
            }
        } else {
            if (fixed) {
                fixed = false;
                $("#to-top").hide("slow", function() {
                    $("#to-top").css({
                        display: "none"
                    });
                });
                if ($('#sidebar-wrapper').hasClass("active")) {
                	$('#sidebar-wrapper').toggleClass("active");
                }
                if ($('.overlay').hasClass("active")) {
                	$('.overlay').toggleClass("active");
                }
            }
        }
    });
    
    
    $(function() {
        $("a[href*=#]:not([href=#])").click(function() {
            if (location.pathname.replace(/^\//, "") == this.pathname.replace(/^\//, "") || location.hostname == this.hostname) {
                var target = $(this.hash);
                target = target.length ? target : $("[name=" + this.hash.slice(1) + "]");
                if (target.length) {
                    $("html,body").animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    
                if ($('.overlay').hasClass("active")) {
                	$('.overlay').toggleClass("active");
                }
                    return false;
                }
            }
        });
    });
    
    $("body").scrollspy({
        target: ".bs-docs-sidebar",
        offset: 400
    });
    $("#sidebar").affix({
        offset: {
            top: $("#sidebar").offset().top
        }
    });

    $(function() {
        $("img.lazy").lazyload();
    });

    $("img.lazy").lazyload({
        effect: "fadeIn",
        threshold: 200
    });