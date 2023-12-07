!function(e,t){"function"==typeof define&&define.amd?define([],t):"object"==typeof module&&module.exports?module.exports=t():e.Rellax=t()}(this,function(){var y=function(e,t){"use strict";var x=Object.create(y.prototype),l=0,b=0,p=0,T=0,d=[],o=!0,n=window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||window.msRequestAnimationFrame||window.oRequestAnimationFrame||function(e){return setTimeout(e,1e3/60)},r=null,i=window.cancelAnimationFrame||window.mozCancelAnimationFrame||clearTimeout,c=window.transformProp||function(){var e=document.createElement("div");if(null===e.style.transform){var t=["Webkit","Moz","ms"];for(var o in t)if(void 0!==e.style[t[o]+"Transform"])return t[o]+"Transform"}return"transform"}();x.options={speed:-2,center:!1,wrapper:null,relativeToWrapper:!1,round:!0,vertical:!0,horizontal:!1,callback:function(){}},t&&Object.keys(t).forEach(function(e){x.options[e]=t[e]}),e||(e=".rellax");var s="string"==typeof e?document.querySelectorAll(e):[e];if(!(0<s.length))throw new Error("The elements you're trying to select don't exist.");if(x.elems=s,x.options.wrapper&&!x.options.wrapper.nodeType){var a=document.querySelector(x.options.wrapper);if(!a)throw new Error("The wrapper you're trying to use don't exist.");x.options.wrapper=a}var u=function(){for(var e=0;e<d.length;e++)x.elems[e].style.cssText=d[e].style;d=[],b=window.innerHeight,T=window.innerWidth,m(),function(){for(var e=0;e<x.elems.length;e++){var t=f(x.elems[e]);d.push(t)}}(),o&&(window.addEventListener("resize",u),o=!1),h()},f=function(e){var t=e.getAttribute("data-rellax-percentage"),o=e.getAttribute("data-rellax-speed"),n=e.getAttribute("data-rellax-zindex")||0,r=x.options.wrapper?x.options.wrapper.scrollTop:window.pageYOffset||document.documentElement.scrollTop||document.body.scrollTop;x.options.relativeToWrapper&&(r=(window.pageYOffset||document.documentElement.scrollTop||document.body.scrollTop)-x.options.wrapper.offsetTop);var i=x.options.vertical&&(t||x.options.center)?r:0,s=x.options.horizontal&&(t||x.options.center)?window.pageXOffset||document.documentElement.scrollLeft||document.body.scrollLeft:0,a=i+e.getBoundingClientRect().top,l=e.clientHeight||e.offsetHeight||e.scrollHeight,p=s+e.getBoundingClientRect().left,d=e.clientWidth||e.offsetWidth||e.scrollWidth,c=t||(i-a+b)/(l+b),u=t||(s-p+T)/(d+T);x.options.center&&(c=u=.5);var f=o||x.options.speed,m=z(u,c,f),w=e.style.cssText,h="";if(0<=w.indexOf("transform")){var y=w.indexOf("transform"),v=w.slice(y),g=v.indexOf(";");h=g?" "+v.slice(11,g).replace(/\s/g,""):" "+v.slice(11).replace(/\s/g,"")}return{baseX:m.x,baseY:m.y,top:a,left:p,height:l,width:d,speed:f,style:w,transform:h,zindex:n}},m=function(){var e=l,t=p;if(l=x.options.wrapper?x.options.wrapper.scrollTop:(document.documentElement||document.body.parentNode||document.body).scrollTop||window.pageYOffset,p=x.options.wrapper?x.options.wrapper.scrollLeft:(document.documentElement||document.body.parentNode||document.body).scrollLeft||window.pageXOffset,x.options.relativeToWrapper){var o=(document.documentElement||document.body.parentNode||document.body).scrollTop||window.pageYOffset;l=o-x.options.wrapper.offsetTop}return!(e==l||!x.options.vertical)||!(t==p||!x.options.horizontal)},z=function(e,t,o){var n={},r=o*(100*(1-e)),i=o*(100*(1-t));return n.x=x.options.round?Math.round(r):Math.round(100*r)/100,n.y=x.options.round?Math.round(i):Math.round(100*i)/100,n},w=function(){m()&&!1===o&&h(),r=n(w)},h=function(){for(var e,t=0;t<x.elems.length;t++){var o=(l-d[t].top+b)/(d[t].height+b),n=(p-d[t].left+T)/(d[t].width+T),r=(e=z(n,o,d[t].speed)).y-d[t].baseY,i=e.x-d[t].baseX,s=d[t].zindex,a="translate3d("+(x.options.horizontal?i:"0")+"px,"+(x.options.vertical?r:"0")+"px,"+s+"px) "+d[t].transform;x.elems[t].style[c]=a}x.options.callback(e)};return x.destroy=function(){for(var e=0;e<x.elems.length;e++)x.elems[e].style.cssText=d[e].style;o||(window.removeEventListener("resize",u),o=!0),i(r),r=null},u(),w(),x.refresh=u,x};return y});