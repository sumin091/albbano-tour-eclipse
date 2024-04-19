/**
 * Swiper 4.4.6
 * Most modern mobile touch slider and framework with hardware accelerated transitions
 * http://www.idangero.us/swiper/
 *
 * Copyright 2014-2018 Vladimir Kharlampidi
 *
 * Released under the MIT License
 *
 * Released on: December 19, 2018
 */
$(document).ready(function(){						
			
	var newsList = new Swiper('.swiper-container2', {				

		slidesPerView: 4, 
		initialSlide:3,
		spaceBetween: 15,
		slidesPerGroup: 1,
		loop: false, // false 로 고정하셔야 합니다.
		centeredSlides: false,
		loopFillGroupWithBlank: true,
		autoplay: {
			delay: 4000, //롤링되는 속도
			disableOnInteraction: false
		},
		scrollbar: {
			el: '.swiper-scrollbar2',
			hide: false,
		},
		navigation: {
			nextEl: '.swiper-button-next2',
			prevEl: '.swiper-button-prev2',
		},
		pagination:{
			el:'.swiper-pagination2',
			type:'bullets',
			clickable:true
		},
		breakpoints: {
			1230:{
				slidesPerView: "auto",
				slidesPerGroup: 1,
				spaceBetween: 15,
				centeredSlides: true
			}
		}
	});

	$(".swiper-container2 .swiper-slide img").css("width",$(".swiper-container2 .swiper-slide").width());


	$(window).resize(function(){
		$(".swiper-container2 .swiper-slide img").css("width",$(".swiper-container2 .swiper-slide").width());
	}); 

	
});