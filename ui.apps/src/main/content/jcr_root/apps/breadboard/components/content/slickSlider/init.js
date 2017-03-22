use(function(){

    var out = {
        accessibility: new Boolean(properties.get("accessibility", false)),
        arrows: new Boolean(properties.get("arrows"), false),
        autoplay: new Boolean(properties.get("autoplay"), false),
        autoplaySpeed: new Number(properties.get("autoplaySpeed", 3000)),
        centerMode: new Boolean(properties.get("centerMode"), false),
        dots: new Boolean(properties.get("dots"), false),
        dotsClass: new String(properties.get("dotsClass", "slick-dots")),
        draggable: new Boolean(properties.get("draggable"), false),
        easing: new String(properties.get("easing"), "linear"),
        fade: new Boolean(properties.get("fade"), false),
        rtl: new Boolean(properties.get("rtl"), false),
        slidesToShow: new Number(properties.get("slidesToShow"), 1),
        slidesToScroll: new Number(properties.get("slidesToScroll"), 1)
    }

    return JSON.stringify(out).replace(/\"([^(\")"]+)\":/g,"$1:");

});
