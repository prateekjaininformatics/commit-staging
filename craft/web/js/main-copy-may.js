function toggleMenu(){$("#hamburgerMenu").toggleClass("collapsed"),$(".aa-mobile-overlay").animate({height:"toggle",opacity:"toggle"},300)}if(function(e){"use strict";e('a.js-scroll-trigger[href*="#"]:not([href="#"])').click(function(){if(location.pathname.replace(/^\//,"")==this.pathname.replace(/^\//,"")&&location.hostname==this.hostname){var t=e(this.hash);if((t=t.length?t:e("[name="+this.hash.slice(1)+"]")).length)return e("html, body").animate({scrollTop:t.offset().top-54},1e3,"easeInOutExpo"),!1}}),e("body").scrollspy({target:"#mainNav",offset:140});var t=function(){100<e("#mainNav").offset().top?e("#mainNav").addClass("navbar-shrink"):e("#mainNav").removeClass("navbar-shrink")};t(),e(window).scroll(t)}(jQuery),function(m){m.fn.moreLines=function(h){"use strict";return this.each(function(){var t=m(this),e=(t.find("p"),parseFloat(t.css("line-height"))),i=t.innerHeight(),n=m.extend({linecount:1,baseclass:"b-morelines_",basejsclass:"js-morelines_",classspecific:"section",buttontxtmore:"more lines",buttontxtless:"less lines",animationspeed:1},h),s=n.baseclass+n.classspecific+"_ellipsis",a=n.baseclass+n.classspecific+"_button",o=n.baseclass+n.classspecific+"_wrapper",l=n.basejsclass+n.classspecific+"_wrapper",c=m("<div>").addClass(o+" "+l).css({"max-width":t.css("width")}),r=e*n.linecount;if(t.wrap(c),t.parent().not(l)&&r<i){t.addClass(s).css({"min-height":r,"max-height":r,overflow:"hidden"});var d=m("<div>",{class:a,click:function(){t.toggleClass(s),m(this).toggleClass(a+"_active"),"none"!==t.css("max-height")?t.css({height:r,"max-height":""}).animate({height:i},n.animationspeed,function(){d.html(n.buttontxtless)}):t.animate({height:r},n.animationspeed,function(){d.html(n.buttontxtmore),t.css("max-height",r)})},html:n.buttontxtmore});t.after(d)}}),this}}(jQuery),$(document).ready(function(){var i="disabled",n="active",s="active-sibling",a="pagination";function e(){if(!$(this).hasClass(i)){var t=$(this).closest(".pagination"),e=parseInt(t.data("pagination"),10);e+=1*($(this).hasClass("prev")?-1:1),t.data(a,e),o.apply(t)}}function o(t){var e=$(this).find("li");t=parseInt($(this).data(a),10);e.filter("."+n).removeClass(n),e.filter("."+s).removeClass(s),e.eq(t).addClass(n),0===t?$(this).find(".prev").addClass(i):(e.eq(t-1).addClass(s),$(this).find(".prev").removeClass(i)),t==e.length-1?$(this).find(".next").addClass(i):$(this).find(".next").removeClass(i)}$(".pagination").each(function(){var t=$(this);t.data(a,t.find("li").index(".active")),t.find(".prev").on("click",e),t.find(".next").on("click",e),t.find("li").on("click",function(){var t=$(this).closest(".pagination");t.data(a,t.find("li").index(this)),o.apply(t)})})}),$(function(){var i=$(".rwd-menu"),t=$(".rwd-menu > li > a"),n=$(".rwd-menu > li"),e=$(".back-btn");t.on("click",function(t){var e=$(this).parent();i.addClass("rwd-menu-view"),n.removeClass("open-submenu"),e.addClass("open-submenu")}),e.click(function(){$(this);n.removeClass(),i.removeClass("rwd-menu-view")})}),$(".cards .list-content").click(function(){return window.location=$(this).find("a").attr("href"),!1}),$(".card-wrapper .cta-card").click(function(){return window.location=$(this).find("a").attr("href"),!1}),$(".card-wrapper .card").click(function(){var t=$(this).find("a").attr("href");return-1!==t.indexOf("classy")?window.open(t,"_blank"):window.location=t,!1}),$(".news-wrapper .row").click(function(){var t=$(this).find("a").attr("href");if(!$(this).hasClass("no-click")&&!$(this).hasClass("body")&&t)return console.log(t),window.location=t,!1}),$(".other-news .list-content").click(function(){return window.location=$(this).find("a").attr("href"),!1}),$(".partner-card-wrapper .list-content").click(function(){var t=$(this).find("a").attr("href");return window.open(t,"_blank"),!1}),$(".donation-card-wrapper .list-content").click(function(){var t=$(this).find("a").attr("href");return window.location.href=t,!1}),$(function(){var t=function(t,e){this.el=t||{},this.multiple=e||!1,this.el.find(".link").on("click",{el:this.el,multiple:this.multiple},this.dropdown)};t.prototype.dropdown=function(t){var e=t.data.el;$this=$(this),$next=$this.next(),$next.slideToggle(),$this.parent().toggleClass("open"),t.data.multiple||e.find(".submenu").not($next).slideUp().parent().removeClass("open")};new t($("#accordion"),!1)}),function(t){"use strict";jQuery(".tilt").tilt({maxTilt:15,perspective:1400,easing:"cubic-bezier(.03,.98,.52,.99)",speed:1200,glare:!1,maxGlare:.2,scale:1.04})}(),$('nav a[href="/'+location.pathname.split("/")[1]+'"]').addClass("active"),0<$(".rellax-a").length)var rellax=new Rellax(".rellax-a",{speed:1.5,center:!0,wrapper:null,round:!0,vertical:!0,horizontal:!1});$(function(){$("#delay-programs").show()}),$(function(){$("#delay-about").show()}),$(function(){$("#delay-support").show()});var testemonialHomeToggled=!1;function dotToggle(t){$("#web-dots").children("span").eq(activeIndex).toggleClass("dot-active"),$("#mobile-dots").children("span").eq(activeIndex).toggleClass("dot-active"),$("#web-dots").children("span").eq(t).toggleClass("dot-active"),$("#mobile-dots").children("span").eq(t).toggleClass("dot-active"),activeIndex=t}function testemonialToggle(t,e){$("#testimonials").children("div").eq(t).toggleClass("testimonial-item-active"),$("#testimonials").children("div").eq(e).toggleClass("testimonial-item-active")}$(".testemonial-control-icon").click(function(){testemonialHomeToggled?(Clock.resume(),testemonialHomeToggled=!1):(Clock.pause(),testemonialHomeToggled=!0)}),$(".web-dot").click(function(){var t=$(this).index();testemonialToggle(activeIndex,t),dotToggle(t),Clock.pause(),testemonialHomeToggled=!0}),$(".mobile-dot").click(function(){var t=$(this).index();testemonialToggle(activeIndex,t),dotToggle(t),Clock.pause(),testemonialHomeToggled=!0});var activeIndex=0,progressStarted=!1,Clock={totalSeconds:0,totalOffset:0,start:function(){var t=this;progressStarted||($("#web-dots").children("span").eq(activeIndex).toggleClass("dot-active"),$("#mobile-dots").children("span").eq(activeIndex).toggleClass("dot-active"),progressStarted=!0),this.interval=setInterval(function(){t.totalSeconds+=1,t.totalSeconds%8==0?(t.totalOffset=0,nextIndex=activeIndex==$("#web-dots").children("span").length-1?0:activeIndex+1,testemonialToggle(activeIndex,nextIndex),dotToggle(nextIndex)):t.totalOffset+=18,$(".progress-circle").css({"stroke-dashoffset":t.totalOffset})},1e3)},pause:function(){clearInterval(this.interval),delete this.interval,$("#testemonial-home-controls").attr("src","img/commit_play_button_dark.png")},resume:function(){this.interval||this.start(),$("#testemonial-home-controls").attr("src","img/Pause_Commit_dark.png")}},CustomTimeline={options:{font:"../css/custom-timeline-font-styles-5b03760403.css"},start:function(){timeline=new TL.Timeline("timeline-embed","https://docs.google.com/spreadsheets/d/1CuxoxodNw3VpBf-eT5YVeo2gmqs4EWkB/edit#gid=563237371",this.options)}};$(".eventsFilterDropdownMenuButtonOption").click(function(){var t=$(this).text(),e=$(this).attr("id");$("#eventsFilterDropdownMenuButton").text(t),"all"===e?$(".col-md-4").css("display","block"):(console.log(".col-md-4 "+e),console.log($(".col-md-4 "+e)),$(".col-md-4").css("display","none"),$(".col-md-4."+e).css("display","block"))}),$(document).ready(function(){Clock.start(),CustomTimeline.start()});