
$(document).ready(function() {


	let size = $(window).width();

	$(window).resize(function() {
		size = $(window).width();
	})
	
/*openModal($(".review_modal"), 1000);*/


	// 리뷰 쓰기 버튼
	$(".review").click(function() {
		let modal;

		if ($(this).hasClass("regi")) {
			modal = $(".review_modal");
		} else {
			modal = $(".review_modify_modal");
			
			const reviewContent = $(this).siblings(".review_content").val();
			const reviewScore = $(this).siblings(".review_score").val();
			
			$(".review_modify_modal textarea").val(reviewContent);
		}

		openModal(modal, size);

		const orderNum = $(this).siblings(".order_num").val();
		const storeId = $(this).siblings(".store_id").val();
		
		console.log(orderNum);

		modal.find(".order_num").val(orderNum);
		modal.find(".store_id").val(storeId);
		
		
		
		// 별점주기
		let score = 0;
	
		$(".score_box i").off().click(function() {
			score = $(this).index() + 1;
				
			$(".score_box i").removeClass("fas");
			$(this).addClass("fas").prevAll().addClass("fas");
	
			modal.find(".score").val(score);
	
			inputCheck(modal);
		});
		
		
		
		$(".review_text textarea").off().keyup(function() {
			inputCheck(modal);
		})
		
		
		
		// 리뷰 작성, 별점 체크 했는지 확인
		function inputCheck(modal) {
			let text = modal.find(".review_text textarea").val();
			let score = modal.find(".score").val();
			
			console.log("text = " + text) ;
			console.log("score = " + score) ;
			 
			
			if(text.length == 0 || score == "" || score == null) {
				modal.find(".review_submit_btn").css("background", "#ddd");
				modal.find(".review_submit_btn").attr("disabled", true);
			} else {
				modal.find(".review_submit_btn").attr("disabled", false);
				modal.find(".review_submit_btn").css("background", "#30DAD9");
			}
			
			console.log("채ㅔ크");
		}
	});
	
	
	
	
	

	
	
	
	









	/* -----------------------------이미지 미리보기----------------------------- */
	var file = document.querySelector(".img");
	/*  var file = $(".img_box .img"); */

	file.onchange = function(e) {
		var fileReader = new FileReader();
		fileReader.readAsDataURL(e.target.files[0]);


		fileReader.onload = function(e) {
			$(".img_box div").css("display", "block");
			console.log(e.target.result);
			$(".preview").attr("src", e.target.result);

			fileReader.onload;
		}
	}

	$(".img_close").click(function() {
		imgClose();
	});

	/* -----------------------------이미지 미리보기----------------------------- */
	/* -----------------------------리뷰 수정 이미지 미리보기----------------------------- */
	/*var modifyImg = document.querySelector(".modify_img");

	modifyImg.onchange = function(e) {
		var fileReader = new FileReader();
		fileReader.readAsDataURL(e.target.files[0]);


		fileReader.onload = function(e) {
			$(".img_box div").css("display", "block");
			console.log(e.target.result);
			$(".preview").attr("src", e.target.result);

			fileReader.onload;
		}
	}

	$(".img_close").click(function() {
		$(".preview").attr("src", "");
		$(".img_box div").css("display", "none");
	});*/
	/* -----------------------------리뷰 수정 이미지 미리보기----------------------------- */
/*	var modal = $(".modal");
	var closeA = $(".closeA");
	var closeB = $(".closeB");
	var modalBg = $(".modal_bg");
	closeB.click(function() {
		closeModal();
	});

	modalBg.click(function() {
		closeModal();
	});

	closeA.click(function() {
		closeModal();
	});*/


/*

	function imgClose() {
		$(".preview").attr("src", "");
		$(".img_box div").css("display", "none");
	}


	function closeModal() {
		modal.scrollTop(0);
		modalBg.hide();
		modal.css("top", "100%");

		imgClose();

		text.val("");
		score = 0;
		$(".score_box i").removeClass("fas");

		$(".submit_btn").css("background", "#ddd");
		$(".submit_btn").attr("disabled", true);

		$("body").css("overflow", "visible");
	};
*/
	$(".order_detail").click(function() {
		const orderNum = $(this).siblings(".order_num").val();
		location.href = "/orderListDetail/" + orderNum;
	});

}); // ready