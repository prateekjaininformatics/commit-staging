// navigation
(function($) {
    "use strict"; // Start of use strict
  
    // Smooth scrolling using jQuery easing
    $('a.js-scroll-trigger[href*="#"]:not([href="#"])').click(function() {
      if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
        var target = $(this.hash);
        target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
        if (target.length) {
          $('html, body').animate({
            scrollTop: (target.offset().top - 54)
          }, 1000, "easeInOutExpo");
          return false;
        }
      }
    });
  
    // Activate scrollspy to add active class to navbar items on scroll
    $('body').scrollspy({
      target: '#mainNav',
      offset: 140
    });
  
    // Collapse Navbar
    var navbarCollapse = function() {
      if ($("#mainNav").offset().top > 100) {
        $("#mainNav").addClass("navbar-shrink");
      } else {
        $("#mainNav").removeClass("navbar-shrink");
      }
    };
    
    // Collapse now if page is not at top
    navbarCollapse();
    // Collapse the navbar when page is scrolled
    $(window).scroll(navbarCollapse);
  
  })(jQuery); // End of use strict

// show more - show less
(function ( $ ) {

    $.fn.moreLines = function (options) {
  
    "use strict";
  
      this.each(function(){
  
        var element = $(this), 
          textelement = element.find("p"),
          baseclass = "b-morelines_",
          basejsclass = "js-morelines_",
          currentclass = "section",
          singleline = parseFloat(element.css("line-height")),
          auto = 1,
          fullheight = element.innerHeight(),
          settings = $.extend({
            linecount: auto,
            baseclass: baseclass,
            basejsclass: basejsclass,
            classspecific: currentclass,
            buttontxtmore: "more lines",
            buttontxtless: "less lines",
            animationspeed: auto
          }, options ),
          
          ellipsisclass = settings.baseclass+settings.classspecific+"_ellipsis",
          buttonclass = settings.baseclass+settings.classspecific+"_button",
          wrapcss = settings.baseclass+settings.classspecific+"_wrapper",
          wrapjs = settings.basejsclass+settings.classspecific+"_wrapper",
          wrapper = $("<div>").addClass(wrapcss+ ' ' +wrapjs).css({'max-width': element.css('width')}),
          linescount = singleline * settings.linecount;
  
        element.wrap(wrapper);
  
        if (element.parent().not(wrapjs)) {
  
          if (fullheight > linescount) {
  
          element.addClass(ellipsisclass).css({'min-height': linescount, 'max-height': linescount, 'overflow': 'hidden'});
  
          var moreLinesButton = $("<div>", {
            "class": buttonclass,
            click: function() {
  
              element.toggleClass(ellipsisclass);
              $(this).toggleClass(buttonclass+'_active');
  
              if (element.css('max-height') !== 'none') {
                element.css({'height': linescount, 'max-height': ''}).animate({height:fullheight}, settings.animationspeed, function () {
                  moreLinesButton.html(settings.buttontxtless);
                });
  
              } else {
                element.animate({height:linescount}, settings.animationspeed, function () {
                  moreLinesButton.html(settings.buttontxtmore);
                  element.css('max-height', linescount);
                });
              }
            },
  
            html: settings.buttontxtmore
          });
  
          element.after(moreLinesButton);
  
          }
        }
      });
  
      return this;
    };
  
  }(jQuery));

//pagination
  $(document).ready(function() {
    var CLASS_DISABLED = "disabled",
        CLASS_ACTIVE = "active",
        CLASS_SIBLING_ACTIVE = "active-sibling",
        DATA_KEY = "pagination";
    
    $(".pagination").each(initPagination);
    
    function initPagination() {
      var $this = $(this);
      
      $this.data(DATA_KEY, $this.find("li").index(".active"));
      
      $this.find(".prev").on("click", navigateSinglePage);
      $this.find(".next").on("click", navigateSinglePage);
      $this.find("li").on("click", function() {
        var $parent = $(this).closest(".pagination");
        $parent.data(DATA_KEY, $parent.find("li").index(this));
        changePage.apply($parent);
      });
    }
    
    function navigateSinglePage() {
      if(!$(this).hasClass(CLASS_DISABLED)) {
        var $parent = $(this).closest(".pagination"),
            currActive = parseInt($parent.data("pagination"), 10);
        
        currActive += 1 * ($(this).hasClass("prev") ? -1 : 1);
        $parent.data(DATA_KEY, currActive);
        
        changePage.apply($parent);
      }
    }
    
    function changePage(currActive) {
      var $list = $(this).find("li"),
          currActive = parseInt($(this).data(DATA_KEY), 10);
      
      $list.filter("."+CLASS_ACTIVE).removeClass(CLASS_ACTIVE);
      $list.filter("."+CLASS_SIBLING_ACTIVE).removeClass(CLASS_SIBLING_ACTIVE);
      
      $list.eq(currActive).addClass(CLASS_ACTIVE);
        
      if(currActive === 0) {
        $(this).find(".prev").addClass(CLASS_DISABLED);
      } else {
        $list.eq(currActive-1).addClass(CLASS_SIBLING_ACTIVE);
        $(this).find(".prev").removeClass(CLASS_DISABLED);
      }
  
      if(currActive == ($list.length - 1)) {
        $(this).find(".next").addClass(CLASS_DISABLED);
      } else {
        $(this).find(".next").removeClass(CLASS_DISABLED);
      }
    }
  });


  function toggleMenu() {
    $("#hamburgerMenu").toggleClass("collapsed");  
    $(".aa-mobile-overlay").animate({
          height: "toggle",
          opacity: "toggle"
      }, 300);
  }

  $(function(){
    var rwdMenu = $('.rwd-menu'),
        topMenu = $('.rwd-menu > li > a'),
        parentLi = $('.rwd-menu > li'),
        backBtn = $('.back-btn');
    
    topMenu.on('click',function(e){
      
      var thisTopMenu = $(this).parent(); // current $this
        rwdMenu.addClass('rwd-menu-view');
        parentLi.removeClass('open-submenu');
        thisTopMenu.addClass('open-submenu'); 
    });
    
    backBtn.click(function(){
      var thisBackBtn = $(this);
      parentLi.removeClass();
      rwdMenu.removeClass('rwd-menu-view');
    });
    
    
  });

  $(".cards .list-content").click(function() {
    window.location = $(this).find("a").attr("href"); 
    return false;
  });


  $(".card-wrapper .cta-card").click(function() {
    window.location = $(this).find("a").attr("href"); 
    return false;
  });

  $(".card-wrapper .card").click(function(e) {
    var links = $(this).find("a")
    var url;
    if(links.length > 1){
      if($(e.target).hasClass('card-custom-link-target')){
        url = $(links['0']).attr("href")
      }
      else {
        url = $(links['1']).attr("href")
      }
    }
    else{
      url = $(this).find("a").attr("href");
    }
    //window.location = $(this).find("a").attr("href");
    if (url.indexOf("classy") !== -1 || $(e.target).attr("data-new-window")) {
      window.open(url, '_blank');
    return false;
    } else {
      window.location = url
       return false;
    }
  $(".donate-cards-b .card").click(function() {
    window.location = $(this).find("a").attr("href"); 
    return false;
  });

  $(".news-wrapper .row").click(function() {
    window.location = $(this).find("a").attr("href"); 
    return false;
  });

  $(".other-news .list-content").click(function() {
    window.location = $(this).find("a").attr("href"); 
    return false;
  });

  $(".partner-card-wrapper .list-content").click(function() {
    var url = $(this).find("a").attr("href");
    window.open(url, '_blank');
    return false;
  });


  $(function() {
    var Accordion = function(el, multiple) {
      this.el = el || {};
      this.multiple = multiple || false;
  
      // Variables privadas
      var links = this.el.find('.link');
      // Evento
      links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
    }
  
    Accordion.prototype.dropdown = function(e) {
      var $el = e.data.el;
        $this = $(this),
        $next = $this.next();
  
      $next.slideToggle();
      $this.parent().toggleClass('open');
  
      if (!e.data.multiple) {
        $el.find('.submenu').not($next).slideUp().parent().removeClass('open');
      };
    }	
  
    var accordion = new Accordion($('#accordion'), false);
  });


  ( function( $ ) {

    "use strict";
  
    $(".tilt").tilt({
      maxTilt: 15,
      perspective: 1400,
      easing: "cubic-bezier(.03,.98,.52,.99)",
      speed: 1200,
      glare: false,
      maxGlare: 0.2,
      scale: 1.04
    });
    
  }( jQuery ) );

//  $(function(){
//    var current = location.pathname;
//    $('nav a').each(function(){
//        var $this = $(this);
//        // if the current path is like this link, make it active
//        if($this.attr('href').indexOf(current) !== -1){
//            $this.addClass('active');
//        }
//    })
//});

$(function() {
  $('nav a[href^="/' + location.pathname.split("/")[1] + '"]').addClass('active');
});

if ($('.rellax-a').length > 0) { 
  var rellax = new Rellax('.rellax-a', {
    speed: 1.5,
    center: true,
    wrapper: null,
    round: true,
    vertical: true,
    horizontal: false
  });
}

$(function(){
  $('#delay-programs').show();
});

$(function(){
  $('#delay-about').show();
});

$(function(){
  $('#delay-support').show();
});