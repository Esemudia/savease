/*---------------------------------------------
Template name:  BNSCloud
Version:        1.2
Author:         ThemeLooks
Author url:     http://themelooks.com

NOTE:
------
Please DO NOT EDIT THIS JS, you may need to use "custom.js" file for writing your custom js.
We may release future updates so it will overwrite this file. it's better and safer to use "custom.js".

[Table of Content]

01: Prevent empty links to scroll
02: Sticky header
03: Parsley form validation
04: Smooth scroll for scroll button
05: Smooth scroll for comment reply
06: Team member slider
07: Video popup
08: Back to top button
09: Counter
10: Google map
11: Changing svg color
12: Isotope for Blog
13: Preloader
14: Content animation

----------------------------------------------*/


(function($) {
    "use strict";
    $(function(){

        /* 01: Prevent empty links to scroll
        ==============================================*/

        $('.header-menu a[href="#"]').on('click', function(event) {
            event.preventDefault();
        });

        
        /* 02: Sticky header
        ==============================================*/

        var mainHeader = $('.main-header');

        if( mainHeader.length ) {
            var sticky = new Waypoint.Sticky({
                element: mainHeader[0],
                stuckClass: 'sticking',
                offset: -1
            });
        }

        /* ------------------------------------------------------------------------- *
        * Background Image
        * ------------------------------------------------------------------------- */
        var $bgImg = $('[data-bg-img]');
        
        $bgImg.each(function () {
            var $t = $(this);

            $t.css( 'background-image', 'url(' + $t.data('bg-img') + ')' );
        });

        /* ------------------------------------------------------------------------- *
        * Background Video
        * ------------------------------------------------------------------------- */
        var $bgVideo = $('[data-bg-video]');
        
        if ( $bgVideo.length ) {
            $bgVideo.tubular({videoId: $bgVideo.data('bg-video'), wrapperZIndex: 0});
        }


        /* 03: Parsley form validation
        ==============================================*/

        $('.parsley-validate, .comment-respond form, .review--form form').parsley();


        /* 04: Smooth scroll for scroll button
        ==============================================*/
        
        var $mainBanner = $('.main-banner');
        
        $mainBanner.on('click', '.goDown', function(){
            var $target = $mainBanner.next();
            
            if ( $target.length ) {
                $('html, body').animate({
                    scrollTop: $target.offset().top - 50
                }, 500);
            }
        });
        
        /* 06: Team member slider
        ==============================================*/
        
        var swiperTeam = new Swiper('.review-slider', {
            slidesPerView: 3,
            spaceBetween: 30,
            autoplay: {
                delay: 5000,
                disableOnInteraction: true,
            },
            pagination: {
                el: '.review-pagination',
                clickable: true,
            },
            breakpoints: {
                // when window width is <= 575px
                575: {
                    slidesPerView: 1
                },
                // when window width is <=991px
                991: {
                    slidesPerView: 2
                }
            }
        });

        
        /* 07: Video popup
        ==============================================*/

        var $youtubePopup = $('.youtube-popup');

        if($youtubePopup.length) {

            $youtubePopup.magnificPopup({
                type:'iframe'
            });
        }

        
        /* 08: Back to top button
        ==============================================*/

        var $backToTopBtn = $('.back-to-top');

        if ($backToTopBtn.length) {
            var scrollTrigger = 400, // px
            backToTop = function () {
                var scrollTop = $(window).scrollTop();
                if (scrollTop > scrollTrigger) {
                    $backToTopBtn.addClass('show');
                } else {
                    $backToTopBtn.removeClass('show');
                }
            };

            backToTop();

            $(window).on('scroll', function () {
                backToTop();
            });

            $backToTopBtn.on('click', function (e) {
                e.preventDefault();
                $('html,body').animate({
                    scrollTop: 0
                }, 700);
            });
        }


        /* 09: Counter
        ==============================================*/

        var happyCounter = $('.happy-counter li');

        if (happyCounter.length) {
            
            var a = 0;
            $(window).scroll(function() {

                var oTop = happyCounter.offset().top - window.innerHeight;
                if (a === 0 && $(window).scrollTop() > oTop) {

                    var $dataCount = $('[data-count]');

                    $dataCount.each(function() {
                        var $this = $(this),
                            countTo = $this.attr('data-count');
                        $({
                            countNum: $this.text()
                        }).animate({
                            countNum: countTo
                        },

                        {
                            duration: 2000,
                            easing: 'swing',
                            step: function() {
                                $this.text(Math.floor(this.countNum));
                            },
                            complete: function() {
                                $this.text(this.countNum);
                                //alert('finished');
                            }
                        });
                    });
                    a = 1;
                }
            }).scroll();
        }

        
        /* 10: Google map
        ==============================================*/

        var $map = $('[data-trigger="map"]'),
            $mapOps,
            $mapMarker;

        if ( $map.length ) {
            // Map Options
            $mapOps = $map.data('map-options');
            $mapMarker = $map.data('marker');

            // Map Initialization
            var initMap = function () {
                $map.css('min-height', '410px');

                $map.each(function () {
                    var $t = $(this), map, lat, lng, zoom;

                    $mapOps = $t.data('map-options');
                    lat = parseFloat($mapOps.latitude, 10);
                    lng = parseFloat($mapOps.longitude, 10);
                    zoom = parseFloat($mapOps.zoom, 10);

                    map = new google.maps.Map($t[0], {
                        center: {lat: lat, lng: lng},
                        zoom: zoom,
                        scrollwheel: false,
                        disableDefaultUI: true,
                        zoomControl: true,
                        styles: [
                            {
                                "featureType": "water",
                                "elementType": "geometry",
                                "stylers": [{"color": "#e9e9e9"}, {"lightness": 17}]
                            },
                            {
                                "featureType": "landscape",
                                "elementType": "geometry",
                                "stylers": [{"color": "#f5f5f5"}, {"lightness": 20}]
                            },
                            {
                                "featureType": "road.highway",
                                "elementType": "geometry.fill",
                                "stylers": [{"color": "#ffffff"}, {"lightness": 17}]
                            },
                            {
                                "featureType": "road.highway",
                                "elementType": "geometry.stroke",
                                "stylers": [{"color": "#ffffff"}, {"lightness": 29}, {"weight": 0.2}]
                            },
                            {
                                "featureType": "road.arterial",
                                "elementType": "geometry",
                                "stylers": [{"color": "#ffffff"}, {"lightness": 18}]
                            },
                            {
                                "featureType": "road.local",
                                "elementType": "geometry",
                                "stylers": [{"color": "#ffffff"}, {"lightness": 16}]
                            },
                            {
                                "featureType": "poi",
                                "elementType": "geometry",
                                "stylers": [{"color": "#f5f5f5"}, {"lightness": 21}]
                            },
                            {
                                "featureType": "poi.park",
                                "elementType": "geometry",
                                "stylers": [{"color": "#dedede"}, {"lightness": 21}]
                            },
                            {
                                "elementType": "labels.text.stroke",
                                "stylers": [{"visibility": "on"}, {"color": "#ffffff"}, {"lightness": 16}]
                            },
                            {
                                "elementType": "labels.text.fill",
                                "stylers": [{"saturation": 36}, {"color": "#333333"}, {"lightness": 40}]
                            },
                            {
                                "elementType": "labels.icon",
                                "stylers": [{"visibility": "off"}]
                            },
                            {
                                "featureType": "transit",
                                "elementType": "geometry",
                                "stylers": [{"color": "#f2f2f2"}, {"lightness": 19}]
                            },
                            {
                                "featureType": "administrative",
                                "elementType": "geometry.fill",
                                "stylers": [{"color": "#fefefe"}, {"lightness": 20}]
                            },
                            {
                                "featureType": "administrative",
                                "elementType": "geometry.stroke",
                                "stylers": [{"color": "#fefefe"}, {"lightness": 17}, {"weight": 1.2}]
                            }
                        ]
                    });

                    map = new google.maps.Marker({
                        position: {lat: lat, lng: lng},
                        map: map,
                        animation: google.maps.Animation.DROP,
                        draggable: true,
                        icon: $mapMarker
                    });
                });
            };

            initMap();

        }

        /* 11: Changing svg color
        ==============================================*/

        jQuery('img.svg').each(function(){
            var $img = jQuery(this);
            var imgID = $img.attr('id');
            var imgClass = $img.attr('class');
            var imgURL = $img.attr('src');
        
            jQuery.get(imgURL, function(data) {
                // Get the SVG tag, ignore the rest
                var $svg = jQuery(data).find('svg');
        
                // Add replaced image's ID to the new SVG
                if(typeof imgID !== 'undefined') {
                    $svg = $svg.attr('id', imgID);
                }
                // Add replaced image's classes to the new SVG
                if(typeof imgClass !== 'undefined') {
                    $svg = $svg.attr('class', imgClass+' replaced-svg');
                }
        
                // Remove any invalid XML tags as per http://validator.w3.org
                $svg = $svg.removeAttr('xmlns:a');
                
                // Check if the viewport is set, else we gonna set it if we can.
                if(!$svg.attr('viewBox') && $svg.attr('height') && $svg.attr('width')) {
                    $svg.attr('viewBox', '0 0 ' + $svg.attr('height') + ' ' + $svg.attr('width'));
                }
        
                // Replace image with new SVG
                $img.replaceWith($svg);
        
            }, 'xml');
        });

    });

    
    /* 12: Isotope for Blog
    ==============================================*/
    $(window).on('load', function(){

        $('.isotope').isotope({
            itemSelector: '.isotope > div'
        });

    });


    /* 13: Preloader
    ==============================================*/

    $(window).on('load', function(){

        function removePreloader() {
            var preLoader = $('.preLoader');
            preLoader.fadeOut();
        }
        setTimeout(removePreloader, 250);
    });


    /* 14: Content animation
    ==============================================*/

    $(window).on('load', function(){

        var $animateEl = $('[data-animate]');

        $animateEl.each(function () {
            var $el = $(this),
                $name = $el.data('animate'),
                $duration = $el.data('duration'),
                $delay = $el.data('delay');

            $duration = typeof $duration === 'undefined' ? '0.6' : $duration ;
            $delay = typeof $delay === 'undefined' ? '0' : $delay ;

            $el.waypoint(function () {
                $el.addClass('animated ' + $name)
                   .css({
                        'animation-duration': $duration + 's',
                        'animation-delay': $delay + 's'
                   });
            }, {offset: '93%'});
        });
    });

    // Header Sticky Animation
    $(window).on("scroll", function () {
        if ($(".main-header").hasClass("sticking")) {
            $(".main-header").addClass("fadeInDown animated");
        } else {
            $(".main-header").removeClass("fadeInDown animated");
        }
    });

})(jQuery);