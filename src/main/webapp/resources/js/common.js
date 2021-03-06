
$(function () {
    // menu toggle
    $(".ico_menu").on("click", function () {
        if ($(".side_menu").hasClass("active")) {
            $(".side_menu").removeClass("active");
            
            $(".modal").hide();
        } else {
            $(".side_menu").addClass("active");
            $(".modal").show();
        }
    });

    // modal close
    $(".modal").on("click", function () {
        $(".side_menu").removeClass("active");
        $(".modal").hide();
		$(".layerPop").html("").hide();

    });

    // menu close
    $(".close_menu").on("click", function () {
        $(".side_menu").removeClass("active");
        $(".modal").hide();
    });

    // service toggle
    $("#notice > ul > li").on("click", function () {
        const url = $(this).data("url");
        if (url == "service") {
            if ($(".service_sub").hasClass("active")) {
                $(".service_sub").removeClass("active");
            } else {
                $(".service_sub").addClass("active");
            }

        } else {
			if (url == "home") {
				location.href = contextPath;
			} else if (url == "qna") {
				if (loginMemberNo > 0) {
					layerPopQna(0);
				} else {
					alert("로그인이 필요 합니다.");
					location.href = contextPath + "/member/login";
				}
				
			} else {
            	alert(url);
			}
        }
    });

    // service location href
    $("#notice > ul > li .service_sub > li").on("click", function () {
        const url = $(this).data("url");
		alert(url);
    });
	
});

// 문의 팝업
function layerPopQna(layerValue) {
	const html = `
		<div class="popup_wrap">
			<div class="pop_header">질문 작성하기</div>
			<div class="pop_container reviews">
				<article class="reserve_price">
					<div class="box_form">
						<div class="tit">
							<label for="reason_cancel">질문</label>
						</div>
						<span class="option">
							<span class="txt_count">
								<em>0</em>자/<em>200</em>자
							</span>
						</span>
						<div class="input">
							<input type="hidden" name="spaceNo" value="${layerValue}">
							<textarea maxlength="200" id="queContent" placeholder="질문을 남겨 주세요."></textarea>
						</div>
					</div>
				</article>
				<p class="p_guide">
					<i class="sp_icon ico_alert"></i>
			    	질문은 공개 상태로만 등록하실 수 있습니다.
				</p>
				<div class="btns">
					<a class="btn btn_full cancel btn_negative">취소</a>
					<a class="btn btn_full submit btn_default" id="qnaWrite">등록</a>
				</div>
			</div>
			<a title="레이어팝업 닫힘" class="btn_pop_close">
				<img src="${contextPath}/resources/images/common/close_white_18.svg" />
			</a>
		</div>
	`;
	
	if ($(".layerPop").children().length == 0) {
		$(".layerPop").html(html);
	}
	
	$(".side_menu").removeClass("active");
	$(".modal").show();
	$(".layerPop").show();
}

// 문의 등록
$(document).on("click", "#qnaWrite", function(){
	if ($("#queContent").val().trim().length == 0) {
		alert("문의내용을 입력해 주세요");
		$("#queContent").focus();
		return false;	
	}
	
	const spaceNo = $("input[name='spaceNo']").val();
	
	if (loginMemberNo > 0) {
		$.ajax({
			url : contextPath + "/my/qna/insert",
			method : "post",
			data : {
				spaceNo : spaceNo,
				queContent : $("#queContent").val()
			},
			success : function (result) {
				if (result > 0) {
					alert("등록되었습니다.");
					layerPopClose();
	
					// 문의 페이지
					if ($(".l_area").length) {
						qnaListRoad("all");
					}
	
					// 공간상세 페이지
					if ($(".qna_list").length && spaceNo > 0) {
						qnaSpaceListRoad("space", spaceNo);
					}
					
				} else {
					alert("문의 실패 하였습니다.");
				}
					
			},
			error : function (req, status, error) {
				console.log("문의 등록 실패");
				console.log(req.responseText);
			}
			
		});

	} else {
		alert("로그인이 필요 합니다.");
		location.href = contextPath + "/member/login";
	}
	
});

// qna 목록
function qnaListRoad(sortValue, spaceNo="") {
	$.ajax({
		url : contextPath + "/my/qna/sort",
		data : {
			sort : sortValue,
			spaceNo : spaceNo
		},
		dataType : "json",
		success : function (qnaList) {
			$(".l_area").empty();
			
			if (sortValue == "all") {
				$("#qna_sort").val("all").prop("selected", true);
			}
			
			let html = "";
			$.each(qnaList, function (index, qna) {
				let spaceImg = "";
				if (qna.spaceImgNm) {
					spaceImg = `<img class="list_img" src="${contextPath}${qna.spaceImgPath}${qna.spaceImgNm}">`;
				} else {
					spaceImg = `<img class="list_img" src="${contextPath}/resources/images/defaultUser.jpg">`;
				}
				
				html += `
					<div class="list">
	                    <div class="img_area">
							${spaceImg}
    	            	</div>
	                    <div class="content_area">
	                        <div class="title">${qna.queTitle}</div>
	                        <div class="content">${qna.queContent}</div>
	                        <div class="date">${qna.queDt}</div>
	                    </div>
	                </div>
				`;
			
			});
			
			$(".l_area").html(html);
			

		},
		error : function (req, status, error) {
			console.log("오류가 발생했습니다.");
			console.log(req.responseText);
		}
	});
}

// 공간상세 qna 목록
function qnaSpaceListRoad(sortValue, spaceNo="") {
	$.ajax({
		url : contextPath + "/my/qna/space",
		data : {
			sort : sortValue,
			spaceNo : spaceNo
		},
		dataType : "json",
		success : function (qnaList) {
			$(".qna_list").empty(); // 기존 댓글 내용 모두 삭제

			if (sortValue == "all") {
				$("#qna_sort").val("all").prop("selected", true);
			}
		
			// 이용 후기 갯수 추가
			$("#s-qna .txt-primary em").text(qnaList.length);
			
			// let html = "";
			$.each(qnaList, function (index, qnaSpace) {
				const imgCheck = qnaSpace.memberImgNm;
				
				let qnaImg = "";
				if (imgCheck) {
					qnaImg = `<span class="pf-img" style="background-image: url(${contextPath}${qnaSpace.memberImgPath}${qnaSpace.memberImgNm});"></span>`
				} else {
					qnaImg = `<span class="pf-img" style="background-image: url(${contextPath}/resources/images/defaultUser.jpg);"></span>`
				}

				html = `
					<li class="rlist">
						<div class="rbox-mine">
							${qnaImg}
							<strong class="guest-name">${qnaSpace.memberNm}</strong>
							<p class="p-review">
								${qnaSpace.queContent}
							</p>
							<div class="rbox-info-base">
								<span class="time-info">${qnaSpace.queDt}</span>
							</div>
						</div>
					</li>
				`;
				
				$(".qna_list").append(html);
			});

		},
		error : function (req, status, error) {
			console.log("오류가 발생했습니다.");
			console.log(req.responseText);
		}
	});
}

// 팝업 취소
$(document).on("click", ".btn_pop_close, .btn.cancel", function(){
	layerPopClose();
});

// 문의 layerPop 닫기
function layerPopClose() {
	$(".modal").hide();
    $(".layerPop").html("").hide();
}


function clearInput(){
	 document.getElementById("searchInput").value ="";
	}