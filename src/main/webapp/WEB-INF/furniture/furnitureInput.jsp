<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <link rel="icon" href="${ctp}/images/favicon.png">
  <title>인테리어 등록하기 | 그린테리어</title>
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
		
		.contain {
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
  $(function() {
	    // '기타'를 선택했을 때만 #etc 영역을 보이도록 설정
	    $('select[name="category"]').change(function() {
	      // 선택된 값이 'etc'일 때 #etc 영역 보이기
	      if ($(this).val() === 'etc') {
	        $('#etc').show();  // #etc 영역 보이기
	      } else {
	        $('#etc').hide();   // '기타'가 아닐 경우 #etc 영역 숨기기
	      }
	    });

	    // 페이지 로드 시 카테고리 값에 따라 #etc 영역을 초기화
	    if ($('select[name="category"]').val() === 'etc') {
	      $('#etc').show();
	    } else {
	      $('#etc').hide();
	    }
	  });
    
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
  </script>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <div class="contain">
    <h1 style="font-family: 'EliceDigitalBaeum-Bd';">게시물 등록</h1>
    <form name="myform" action="InteriorInput.in">

      <!-- 업체명 -->
      <div class="form-group">
        <div class="section-title">업체명</div>
        <hr>
        <input type="text" class="form-control" value="GRINTERIOR" readonly>
      </div>

      <!-- 카테고리 -->
      <div class="form-group">
        <div class="section-title">카테고리</div>
        <hr>
        <select class="form-control" name="category">
          <option>카테고리</option>
          <option value="modern">모던</option>
          <option value="natural">네츄럴</option>
          <option value="vintage">빈티지</option>
          <option value="etc" onclick="etcShow()">기타</option>
        </select>
        <div id="etc" class="hidden">
          <textarea rows="5" class="form-control" placeholder="기타 카테고리 입력"></textarea>
        </div>
      </div>

      <!-- 판매가 -->
      <div class="form-group">
        <div class="section-title">판매가</div>
        <hr>
        <div class="input-group price-group">
          <input type="number" placeholder="가격을 입력하세요" class="form-control" style="width: 95%;">
          <input type="text" value="원" readonly class="form-control" style="width: 4%; text-align: center;">
        </div>
      </div>

      <!-- 할인 설정 -->
      <div class="form-group sale-group">
        <div class="section-title">할인</div>
        <hr>
        <div class="wrap input-group">
				  <div class="radio_area">
				    <input type="radio" name="sale" id="saleCheck" checked>
				    <label for="saleCheck">설정함</label>  
				  </div>
				  <div class="radio_area">
				    <input type="radio" name="sale" id="unSaleCheck">
				    <label for="unSaleCheck">설정안함</label>  
				  </div>  
				</div>
				<div id="slaeBox">
					<div class="section-title">판매가</div>
        <hr>
	        <div class="input-group price-group">
	          <input type="number" placeholder="가격을 입력하세요" class="form-control" style="width: 95%;">
	          <input type="text" value="원" readonly class="form-control" style="width: 4%; text-align: center;">
	        </div>
				</div>
      </div>

      <!-- 상품 이미지 -->
			<div class="form-group">
			  <div class="section-title">상품 이미지</div>
			  <hr>
			  
			  <!-- 대표 이미지 -->
			  <div>
			    <div class="section-title">대표이미지</div>
			    <div class="image-upload-container">
			      <label for="image-upload-main" style="width: 100%; height: 100%; display: flex; justify-content: center; align-items: center;">
			        <div class="plus-icon"><i class="fa-solid fa-plus"></i></div>
			        <img id="image-preview-main" class="image-preview" style="display: none;" />
			      </label>
			      <input type="file" id="image-upload-main" accept="image/*" onchange="handleImageChange(event, 'image-preview-main')" />
			    </div>
			  </div>
			
			  <!-- 상세페이지 이미지 -->
			  <div>
			    <div class="section-title">상세페이지</div>
			    <div class="image-upload-container">
			      <label for="image-upload-detail" style="width: 100%; height: 100%; display: flex; justify-content: center; align-items: center;">
			        <div class="plus-icon"><i class="fa-solid fa-plus"></i></div>
			        <img id="image-preview-detail" class="image-preview" style="display: none;" />
			      </label>
			      <input type="file" id="image-upload-detail" accept="image/*" onchange="handleImageChange(event, 'image-preview-detail')" />
			    </div>
			  </div>
			
			  <!-- 썸네일 이미지 -->
			  <div>
			    <div class="section-title">썸네일이미지</div>
			    <div class="image-upload-container">
			      <label for="image-upload-thumbnail" style="width: 100%; height: 100%; display: flex; justify-content: center; align-items: center;">
			        <div class="plus-icon"><i class="fa-solid fa-plus"></i></div>
			        <img id="image-preview-thumbnail" class="image-preview" style="display: none;" />
			      </label>
			      <input type="file" id="image-upload-thumbnail" accept="image/*" onchange="handleImageChange(event, 'image-preview-thumbnail')" />
			    </div>
			  </div>
			  
			  <hr>
			</div>

      <!-- 제출 버튼 -->
      <button class="learn-more" type="submit">상품 등록</button>
    </form>
  </div>
  
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>
