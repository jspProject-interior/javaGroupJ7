<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <link rel="icon" href="${ctp}/images/favicon.png">
  <title>가구상품 등록하기 | 그린테리어</title>
  <jsp:include page="/include/bs4.jsp"/>
  <style type="text/css">
		/* 기본적인 스타일링 */
		body {
				font-family: Arial, sans-serif;
				background-color: #f4f7f6;
				color: #333;
				margin: 0;
				padding: 0;
		}
		
		#funi {
				width: 80%;
				max-width: 1000px;
				margin: 50px auto;
				background-color: #fff;
				padding: 80px;
				box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
		}
		
		h1 {
				text-align: center;
				color: #2c3e50;
				font-size: 28px;
				margin-bottom: 30px;
		}
		
		.section-title {
				margin-top: 30px; font-size : 18px;
				font-weight: bold;
				color: #2c3e50;
				font-size: 18px;
		}
		
		.form-group {
				margin-bottom: 30px;
		}
		
		.form-control {
				width: 100%;
				padding: 10px;
				margin: 10px 0;
				border: 1px solid #ccc;
				border-radius: 5px;
				font-size: 16px;
		}
		
		select.form-control {
				height: 40px;
		}
		
		input[type="text"] {
				width: calc(100% - 50px);
		}
		
		input[type="file"] {
				margin: 10px 0;
		}
		
		.hidden {
				display: none;
		}
		
		.file-upload div {
				margin-bottom: 15px;
		}
		
		.file-upload span {
				font-size: 16px;
				margin-right: 10px;
		}
		
		/* 가격 입력 부분 */
		.price-group {
				display: flex;
				justify-content: space-between;
				align-items: center;
		}
		
		.price-group input[type="text"] {
				width: 80%;
		}
		
		.price-group input[type="text"]:focus {
				border-color: #3498db;
				box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
		}
		
		.sale-group {
				margin-top: 20px;
		}
		
		.sale-group label {
				margin-right: 15px;
				font-size: 16px;
		}
		
		/* 버튼 스타일 */
		button[type="submit"] {
				color: white;
				font-size: 18px;
				padding: 15px 30px;
				border: none;
				border-radius: 5px;
				width: 100%;
				cursor: pointer;
				transition: background-color 0.3s;
		}
		
		
		hr {
				border: 1px solid #eee;
		}
		
		
		/* 라디오 버튼 */
		
		.wrap .radio_area label {
				cursor: pointer;
				display: flex;
				align-items: center;
				gap: 15px;
				height: 40px;
				padding: 0 18px 0 15px;
				font-size: 15px;
				font-weight: 500;
				color: #999;
				background: ;
				transition: all .2s;
				border: 1px solid #eee;
		}
		
		.wrap .radio_area label span {
				opacity: .3;
				display: flex;
				width: 18px;
				height: 18px;
				border: 2px solid #111;
				border-radius: 50%;
				transition: all .2s
		}
		
		.wrap .radio_area label span:before {
				content: "";
				width: 6px;
				height: 6px;
				margin: auto;
				border-radius: 50%;
				background: #111;
				transition: all .2s
		}
		
		.wrap .radio_area label:hover {
				background: #e1e1e1
		}
		
		.radio_area input[type=radio] {
				display: none
		}
		
		.radio_area input[type=radio]:checked+label {
				color: #fff;
				background: #8a7c66;
		}
		
		.radio_area input[type=radio]:checked+label span {
				opacity: 1;
				border-color: #fff
		}
		
		.radio_area input[type=radio]:checked+label span:before {
				background: #fff
		}

		/* 이미지 업로드 박스 스타일 */
    .image-upload-container {
      display: flex;
      justify-content: center;
      align-items: center;
      width: 100%;
      height: 200px;
      background-color: #f5f5f5;
      border-radius: 10px;
      border: 2px dashed #ccc;
      cursor: pointer;
      position: relative;
    }

    .image-upload-container input[type="file"] {
      display: none;
    }

    .image-upload-container .plus-icon {
      font-size: 36px;
      color: #8a7c66;
      font-weight: bold;
    }

    .image-preview {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      max-width: 100%;
      max-height: 100%;
      object-fit: contain;
      border-radius: 10px;
    }

    /* 이미지 업로드 버튼을 클릭했을 때 플러스 아이콘 외에도 이미지 미리보기 */
    .image-upload-container img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      border-radius: 10px;
    }
    

		/* 색상 변수 */
		:root {
		  --bg: #fff;
		  --text: #382b22;
	    --light-pink: #e4dfcb; 
		  --pink: #8a7c66;       
		  --dark-pink: #6e5f4f;  
		  --pink-border: #8a7c66;
		  --pink-shadow: #b8b094;
		}
		
		button {
		  position: relative;
		  display: inline-block;
		  cursor: pointer;
		  outline: none;
		  border: 0;
		  vertical-align: middle;
		  text-decoration: none;
		  font-size: inherit;
		  font-family: inherit;
		}
		
		button.learn-more {
		  font-weight: 600;
		  color: var(--text);
		  width: 100%;
		  text-transform: uppercase;
		  padding: 1.25em 2em;
		  background: var(--light-pink);
		  border: 2px solid var(--pink-border);
		  border-radius: 0.75em;
		  transform-style: preserve-3d;
		  transition: transform 150ms cubic-bezier(0, 0, 0.58, 1), background 150ms cubic-bezier(0, 0, 0.58, 1);
		}
		
		button.learn-more::before {
		  position: absolute;
		  content: '';
		  width: 100%;
		  height: 100%;
		  top: 0;
		  left: 0;
		  right: 0;
		  bottom: 0;
		  background: var(--dark-pink);
		  border-radius: inherit;
		  box-shadow: 0 0 0 2px var(--pink-border), 0 0.625em 0 0 var(--pink-shadow);
		  transform: translate3d(0, 0.75em, -1em);
		  transition: transform 150ms cubic-bezier(0, 0, 0.58, 1), box-shadow 150ms cubic-bezier(0, 0, 0.58, 1);
		}
		
		button.learn-more:hover {
		  transform: translate(0, 0.25em);
		}
		
		button.learn-more:hover::before {
		  box-shadow: 0 0 0 2px var(--pink-border), 0 0.5em 0 0 var(--pink-shadow);
		  transform: translate3d(0, 0.5em, -1em);
		}
		
		button.learn-more:active {
		  background: var(--light-pink);
		  transform: translate(0em, 0.75em);
		}
		
		button.learn-more:active::before {
		  box-shadow: 0 0 0 2px var(--pink-border), 0 0 var(--pink-shadow);
		  transform: translate3d(0, 0, -1em);
		}
</style>
  <script type="text/javascript">
  function fCheck() {
	    let titleImg = document.getElementById("image-upload-main").value;
	    let subImg = document.getElementById("image-upload-detail").value;
	    let thumbnail = document.getElementById("image-upload-thumbnail").value;
	    let titleImgExt = titleImg.substring(titleImg.lastIndexOf(".") + 1).toLowerCase();
	    let subImgExt = subImg.substring(subImg.lastIndexOf(".") + 1).toLowerCase();
	    let thumbnailExt = thumbnail.substring(thumbnail.lastIndexOf(".") + 1).toLowerCase();
	    let maxSize = 1024 * 1024 * 50;
	    let validExtensions = ['jpg', 'gif', 'png'];
			let title = document.getElementById("title").value;
			let category = document.getElementById("category").value;
			let pay = document.getElementById("pay").value;
			let discount = document.getElementById("discount").value;
	    
	    if (title.trim() == "") {
	        alert("제목을 입력해주세요");
	        myform.title.focus();
	        return false;
	    }
	    
	    if (category.trim() == "null") {
	        alert("카테고리를 선택해주세요");
	        myform.category.focus();
	        return false;
	    }
	    if (pay.trim() == "") {
	        alert("판매가격을 입력해주세요");
	        myform.pay.focus();
	        return false;
	    }
	    
	    if (discount.trim() == "") {
	        alert("할인율(금액)을 입력해주세요");
	        myform.discount.focus();
	        return false;
	    }
	    
	    if (titleImg.trim() === "" || subImg.trim() === "" || thumbnail.trim() === "") {
	        alert("업로드할 파일을 선택하세요");
	        myform.title.focus();
	        return false;
	    }

	    // 파일 크기 확인
	    let titleImgSize = document.getElementById("image-upload-main").files[0].size;
	    let subImgSize = document.getElementById("image-upload-detail").files[0].size;
	    let thumbnailSize = document.getElementById("image-upload-thumbnail").files[0].size;
	    if (titleImgSize > maxSize || subImgSize > maxSize || thumbnailSize > maxSize) {
	        alert("업로드할 1개 파일의 최대용량은 50MByte 입니다.");
	        myform.title.focus();
	        return false;
	    }

	    if (!validExtensions.includes(titleImgExt)) {
	        alert("대표 이미지 업로드 가능한 파일은 'jpg/gif/png'만 가능합니다.");
	        myform.title.focus();
	        return false;
	    }
	    if (!validExtensions.includes(subImgExt)) {
	        alert("상세 페이지 업로드 가능한 파일은 'jpg/gif/png'만 가능합니다.");
	        myform.title.focus();
	        return false;
	    }
	    if (!validExtensions.includes(thumbnailExt)) {
	        alert("썸네일 이미지 업로드 가능한 파일은 'jpg/gif/png'만 가능합니다.");
	        myform.title.focus();
	        return false;
	    }
	    myform.submit();
	}
  
		//이미지 선택 시 미리보기 처리 함수
		  function handleImageChange(event, previewId) {
		    const file = event.target.files[0]; // 파일 객체 얻기
		    if (file) {
		      const reader = new FileReader(); // FileReader 객체 생성
		      
		      // 파일이 읽히면 실행되는 콜백 함수
		      reader.onload = function(e) {
		        const imageUrl = e.target.result; // 이미지 URL 얻기
		        const imagePreview = document.getElementById(previewId); // 미리보기 이미지 요소
		        
		        imagePreview.src = imageUrl; // 이미지 URL을 src에 설정
		        imagePreview.style.display = 'block'; // 이미지를 표시
		      };
		      
		      // 파일을 Data URL 형식으로 읽어들임
		      reader.readAsDataURL(file);
		    }
		  }
		
		  function discountType() {
			  const saleType = document.querySelector('input[name="saleType"]:checked').value;
			  const saleUnit = document.getElementById("saleUnit"); // id는 문자열로 가져와야 함
			  saleUnit.value = saleType === "percent" ? "%" : "원";

			  // 할인 유형 변경 후 가격 다시 계산
			  finalPrice();
			}

			function finalPrice() {
			  const pay = Number(document.getElementById("pay").value); // 판매가
			  const discount = Number(document.getElementById("discount").value); // 할인 값
			  const saleType = document.querySelector('input[name="saleType"]:checked').value; // 할인 유형

			  let price = pay;

			  if (saleType === "percent") {
			    // 할인율 계산
			    price = (pay - (pay * (discount / 100))).toFixed(0);
			  } else {
			    // 할인 금액 계산
			    price = pay - discount;
			  }

			  // 최종 판매가가 음수로 내려가지 않도록 처리
			  price = price < 0 ? 0 : price;

			  // 최종 판매가 필드 업데이트
			  document.getElementById("price").value = numberWithCommas(price); // 천 단위 콤마 추가
			}
			function numberWithCommas(num) {
	      return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    }
		
		
  </script>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
  <jsp:include page="/include/header.jsp"/>
  <div id="funi" class="contain">
    <h1 style="font-family: 'EliceDigitalBaeum-Bd';">상품 등록</h1>
    <form name="myform" enctype="multipart/form-data" method="post" action="FurnitureInputOk.fu">
      <!-- 업체명 -->
      <div class="form-group">
        <div class="section-title">업체명</div>
        <hr>
        <input type="text" name="company" id="company" class="form-control" value="${sCompany}" readonly>
      </div>
      <!-- 카테고리 -->
      <div class="form-group">
        <div class="section-title">카테고리</div>
        <hr>
        <select class="form-control" name="category" id="category">
          <option>카테고리</option>
          <option value="SOFA">소파</option>
          <option value="TABLE">테이블</option>
          <option value="CHAIR">의자</option>
          <option value="CABINET">수납·선반장</option>
          <option value="LAMP">조명</option>
          <option value="BED">침대</option>
        </select>
        </div>
      <!-- 상품명 -->
			<div class="form-group">
        <div class="section-title">상품명</div>
        <hr>
        <input type="text" name="title" id="title" class="form-control">
      </div>
			<!-- 판매가 -->
			<div class="form-group">
			  <div class="section-title">판매가</div>
			  <hr>
			  <div class="input-group price-group">
			    <input type="number" name="pay" id="pay" placeholder="가격을 입력하세요" class="form-control" style="width: 95%;" oninput="finalPrice()"/>
			    <input type="text" value="원" readonly class="form-control" style="width: 4%; text-align: center;">
			  </div>
			</div>
			<!-- 할인 입력 -->
			<div class="form-group sale-group">
			  <div class="section-title">할인</div>
			  <hr>
			  <div class="input-group">
			    <label style="margin-right: 10px;">
			      <input type="radio" name="saleType" value="percent" checked onchange="discountType()"> 할인율(%)
			    </label>
			    <label>
			      <input type="radio" name="saleType" value="amount" onchange="discountType()"> 할인 금액(원)
			    </label>
			  </div>
			  <div class="input-group price-group">
			    <input type="number" name="discount" id="discount" placeholder="할인 값을 입력하세요" class="form-control" style="width: 95%;" oninput="finalPrice()"/>
			    <input type="text" name="saleUnit" id="saleUnit" value="%" readonly class="form-control" style="width: 4%; text-align: center;"/>
			  </div>
			</div>
			<!-- 최종 판매가 -->
			<div class="form-group">
			  <div class="section-title">최종 판매가</div>
			  <hr>
			  <div class="input-group price-group">
			    <input type="text" name="price" id="price" readonly class="form-control" style="width: 95%;">
			    <input type="text" value="원" readonly class="form-control" style="width: 4%; text-align: center;">
			  </div>
			</div>

      <!-- 상품 이미지 -->
			<div class="form-group">
			  <div class="section-title">상품 이미지</div>
			  <hr>
			  <div>
			  <!-- 썸네일 이미지 -->
			  <div>
			    <div class="section-title">썸네일이미지</div>
			    <div class="image-upload-container">
			      <label for="image-upload-thumbnail" style="width: 100%; height: 100%; display: flex; justify-content: center; align-items: center;">
			        <div class="plus-icon" id="thumbnail"><i class="fa-solid fa-plus"></i></div>
			        <img id="image-preview-thumbnail" class="image-preview" style="display: none;" />
			      </label>
			      <input type="file" id="image-upload-thumbnail" name="thumbnail" accept="image/*" onchange="handleImageChange(event, 'image-preview-thumbnail')" />
			    </div>
			  </div>
			  <!-- 대표 이미지 -->
			  <div>
			    <div class="section-title">대표이미지</div>
			    <div class="image-upload-container">
			      <label for="image-upload-main" style="width: 100%; height: 100%; display: flex; justify-content: center; align-items: center;">
			        <div class="plus-icon" id="titleImg"><i class="fa-solid fa-plus"></i></div>
			        <img id="image-preview-main" class="image-preview" style="display: none;" />
			      </label>
			      <input type="file" id="image-upload-main" name="titleImg" accept="image/*" onchange="handleImageChange(event, 'image-preview-main')" />
			    </div>
			  </div>
				<hr>
			  <!-- 상세페이지 이미지 -->
			  <div>
			    <div class="section-title">상세페이지</div>
				    <div class="image-upload-container">
				      <label for="image-upload-detail" style="width: 100%; height: 100%; display: flex; justify-content: center; align-items: center;">
				        <div class="plus-icon" id="subImg"><i class="fa-solid fa-plus"></i></div>
				        <img id="image-preview-detail" class="image-preview" style="display: none;" />
				      </label>
				      <input type="file" id="image-upload-detail" name="subImg" accept="image/*" onchange="handleImageChange(event, 'image-preview-detail')" />
				    </div>
				  </div>
					<hr>
				</div>
			</div>
	    <!-- 제출 버튼 -->
	    <button class="learn-more" type="button" onclick="fCheck()">상품 등록</button>
	    <input type="hidden" name="fSize"/>
    </form>
  </div>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>
