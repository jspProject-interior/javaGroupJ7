<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>header.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <jsp:include page="/include/fonts.jsp"/>
  <style>
    #navbar {
      display: flex;
      justify-content: space-between;
      position: fixed;
      width: 100%;
      z-index: 100;
      top: 0;
      left: 0;
      color: var(--color-dark-gray);
      background: linear-gradient(to top, rgba(255, 255, 255, 0) 0%, rgba(0, 0, 0, 0.3) 100%);
      transition: background-color 0.5s ease-in-out, color 0.5s ease-in-out;
      padding: 1%;
    }

    .nav {
      list-style: none;
      display: flex;
    }

    .Logo {
		  font-family: "Playfair Display", serif;
		  font-size: 30px;
		  color: white; /* 기본 글자 색상 */
		  text-decoration: none; /* 기본 밑줄 제거 */
		}
		
		.Logo:hover {
		  color: white; /* 마우스를 올려도 색상 변화 없음 */
		  text-decoration: none; /* 밑줄 제거 */
		}
		
    .menu {
      cursor: pointer;
      width: 25px;
      height: 30px;
      position: relative;
    }

    .menu .bar {
      width: 25px;
      height: 3px;
      background-color: white;
      margin: 6px 0;
      transition: 0.3s ease-in-out;
    }
    .nav a {
      text-decoration: none;
      color: white;
      transition: color 0.5s ease-in-out;
      font-family: 'EliceDigitalBaeum-Bd';
      font-size: 20px;
    }

    .nav a:hover {
      color: white;
      text-decoration: none;
    }
    #navbar.fixed {
      background: white;
      color: black;
    }
    #navbar.fixed a {
      color: black;
    }
    #navbar.fixed .nav a {
      color: black;
    }
    #navbar.fixed .menu .bar {
      background-color: black;
    }

    .menu.active .bar:nth-child(2) {
      opacity: 0;
    }

    .menu.active .bar:first-child {
      transform: rotate(45deg);
      position: absolute;
      top: 3px;
      left: 0;
    }

    .menu.active .bar:last-child {
      transform: rotate(-45deg);
      position: absolute;
      top: 3px;
      left: 0;
    }

    .side-menu {
      position: fixed;
      right: -1100px;
      height: calc(100%);
      width: 1100px;
      background-color: white;
      overflow-x: hidden;
      transition: right 0.3s ease-in-out;
      z-index: 99;
    }

    .side-menu.open {
      right: 0;
    }

    .overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5);
      display: none;
      z-index: 98;
    }

    .overlay.active {
      display: block;
    }
    
    
    // 로그인 창 style
		.box {
	  position: relative;
	  top: 0;
	  opacity: 1;
	  float: left;
	  padding: 60px 50px 40px 50px;
	  width: 100%;
	  background: #fff;
	  border-radius: 10px;
	  transform: scale(1);
	  -webkit-transform: scale(1);
	  -ms-transform: scale(1);
	  z-index: 5;
	
	  &.back {
	    transform: scale(0.95);
	    -webkit-transform: scale(0.95);
	    -ms-transform: scale(0.95);
	    top: -20px;
	    opacity: .8;
	    z-index: -1;
	  }
	
	  &:before {
	    content: "";
	    width: 100%;
	    height: 30px;
	    border-radius: 10px;
	    position: absolute;
	    top: -10px;
	    background: rgba(255, 255, 255, 0.6);
	    left: 0;
	    transform: scale(0.95);
	    -webkit-transform: scale(0.95);
	    -ms-transform: scale(0.95);
	    z-index: -1;
	  }
	}
	
	.overbox .title {
	  color: #fff;
	
	  &:before {
	    background: #fff;
	  }
	}
	
	.title {
	  width: 100%;
	  float: left;
	  line-height: 46px;
	  font-size: 34px;
	  font-weight: 700;
	  letter-spacing: 2px;
	  color: #ED2553;
	  position: relative;
	
	  &:before {
	    content: "";
	    width: 5px;
	    height: 100%;
	    position: absolute;
	    top: 0;
	    left: -50px;
	    background: #ED2553;
	  }
	}
	
	.input {
	  transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
	  -webkit-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
	  -ms-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
	
	  label, input, .spin {
	    transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
	    -webkit-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
	    -ms-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
	  }
	}
	
	.button {
	  transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
	  -webkit-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
	  -ms-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
	
	  button .button.login button i.fa {
	    transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
	    -webkit-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
	    -ms-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
	  }
	}
	
	.material-button .shape {
	  &:before, &:after {
	    transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
	    -webkit-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
	    -ms-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
	  }
	}
	
	.button.login button {
	  transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
	  -webkit-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
	  -ms-transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
	}
	
	.material-button, .alt-2, .material-button .shape, .alt-2 .shape, .box {
	  transition: 400ms cubic-bezier(0.4, 0, 0.2, 1);
	  -webkit-transition: 400ms cubic-bezier(0.4, 0, 0.2, 1);
	  -ms-transition: 400ms cubic-bezier(0.4, 0, 0.2, 1);
	}
	
	.input {
	  width: 100%;
	  float: left;
	
	  label, input, .spin {
	    width: 100%;
	    float: left;
	  }
	}
	
	.button {
	  width: 100%;
	  float: left;
	
	  button {
	    width: 100%;
	    float: left;
	  }
	}
	
	.input, .button {
	  margin-top: 30px;
	  height: 70px;
	}
	
	.input {
	  position: relative;
	
	  input {
	    position: relative;
	  }
	}
	
	.button {
	  position: relative;
	
	  button {
	    position: relative;
	  }
	}
	
	.input {
	  input {
	    height: 60px;
	    top: 10px;
	    border: none;
	    background: transparent;
	    font-family: 'Roboto', sans-serif;
	    font-size: 24px;
	    color: rgba(0, 0, 0, 0.8);
	    font-weight: 300;
	  }
	
	  label {
	    font-family: 'Roboto', sans-serif;
	    font-size: 24px;
	    color: rgba(0, 0, 0, 0.8);
	    font-weight: 300;
	  }
	}
	
	.button button {
	  font-family: 'Roboto', sans-serif;
	  font-size: 24px;
	  color: rgba(0, 0, 0, 0.8);
	  font-weight: 300;
	}
	
	.input {
	  &:before, .spin {
	    width: 100%;
	    height: 1px;
	    position: absolute;
	    bottom: 0;
	    left: 0;
	  }
	
	  &:before {
	    content: "";
	    background: rgba(0, 0, 0, 0.1);
	    z-index: 3;
	  }
	
	  .spin {
	    background: #ED2553;
	    z-index: 4;
	    width: 0;
	  }
	}
	
	.overbox .input {
	  .spin {
	    background: rgba(255, 255, 255, 1);
	  }
	
	  &:before {
	    background: rgba(255, 255, 255, 0.5);
	  }
	}
	
	.input label {
	  position: absolute;
	  top: 10px;
	  left: 0;
	  z-index: 2;
	  cursor: pointer;
	  line-height: 60px;
	}
	
	.button {
	  &.login {
	    width: 60%;
	    left: 20%;
	
	    button {
	      width: 100%;
	      line-height: 64px;
	      left: 0%;
	      background-color: transparent;
	      border: 3px solid rgba(0, 0, 0, 0.1);
	      font-weight: 900;
	      font-size: 18px;
	      color: rgba(0, 0, 0, 0.2);
	    }
	  }
	
	  button {
	    width: 100%;
	    line-height: 64px;
	    left: 0%;
	    background-color: transparent;
	    border: 3px solid rgba(0, 0, 0, 0.1);
	    font-weight: 900;
	    font-size: 18px;
	    color: rgba(0, 0, 0, 0.2);
	  }
	
	  &.login {
	    margin-top: 30px;
	  }
	
	  margin-top: 20px;
	
	  button {
	    background-color: #fff;
	    color: #ED2553;
	    border: none;
	  }
	
	  &.login button {
	    &.active {
	      border: 3px solid transparent;
	      color: #fff !important;
	
	      span {
	        opacity: 0;
	        transform: scale(0);
	        -webkit-transform: scale(0);
	        -ms-transform: scale(0);
	      }
	
	      i.fa {
	        opacity: 1;
	        transform: scale(1) rotate(-0deg);
	        -webkit-transform: scale(1) rotate(-0deg);
	        -ms-transform: scale(1) rotate(-0deg);
	      }
	    }
	
	    i.fa {
	      width: 100%;
	      height: 100%;
	      position: absolute;
	      top: 0;
	      left: 0;
	      line-height: 60px;
	      transform: scale(0) rotate(-45deg);
	      -webkit-transform: scale(0) rotate(-45deg);
	      -ms-transform: scale(0) rotate(-45deg);
	    }
	
	    &:hover {
	      color: #ED2553;
	      border-color: #ED2553;
	    }
	  }
	
	  margin: 40px 0;
	  overflow: hidden;
	  z-index: 2;
	
	  button {
	    cursor: pointer;
	    position: relative;
	    z-index: 2;
	  }
	}
	
	.pass-forgot {
	  width: 100%;
	  float: left;
	  text-align: center;
	  color: rgba(0, 0, 0, 0.4);
	  font-size: 18px;
	}
	
	.click-efect {
	  position: absolute;
	  top: 0;
	  left: 0;
	  background: #ED2553;
	  border-radius: 50%;
	}
	
	.overbox {
	  width: 100%;
	  height: 100%;
	  position: absolute;
	  top: -100px;
	  left: 0;
	  overflow: inherit;
	
	  .title, .button, .input {
	    z-index: 111;
	    position: relative;
	    color: #fff !important;
	    display: none;
	  }
	
	  .title {
	    width: 80%;
	  }
	
	  .input {
	    margin-top: 20px;
	
	    input, label {
	      color: #fff;
	    }
	  }
	
	  .material-button, .alt-2 {
	    display: block;
	
	    .shape {
	      display: block;
	    }
	  }
	}
	
	.material-button, .alt-2 {
	  width: 140px;
	  height: 140px;
	  border-radius: 50%;
	  background: #ED2553;
	  position: absolute;
	  top: 40px;
	  right: -70px;
	  cursor: pointer;
	  z-index: 100;
	  transform: translate(0%, 0%);
	  -webkit-transform: translate(0%, 0%);
	  -ms-transform: translate(0%, 0%);
	}
	
	.material-button .shape, .alt-2 .shape {
	  position: absolute;
	  top: 0;
	  right: 0;
	  width: 100%;
	  height: 100%;
	}
	
	.material-button .shape:before, .alt-2 .shape:before, .material-button .shape:after, .alt-2 .shape:after {
	  content: "";
	  background: #fff;
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%) rotate(360deg);
	  -webkit-transform: translate(-50%, -50%) rotate(360deg);
	  -ms-transform: translate(-50%, -50%) rotate(360deg);
	}
	
	.material-button .shape:before, .alt-2 .shape:before {
	  width: 25px;
	  height: 4px;
	}
	
	.material-button .shape:after, .alt-2 .shape:after {
	  height: 25px;
	  width: 4px;
	}
	
	.material-button.active, .alt-2.active {
	  top: 50%;
	  right: 50%;
	  transform: translate(50%, -50%) rotate(0deg);
	  -webkit-transform: translate(50%, -50%) rotate(0deg);
	  -ms-transform: translate(50%, -50%) rotate(0deg);
	}
	
	body {
	  background-position: center;
	  background-size: cover;
	  background-repeat: no-repeat;
	  min-height: 100vh;
	  font-family: 'Roboto', sans-serif;
	}
	
	.materialContainer {
	  width: 100%;
	  max-width: 460px;
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  -webkit-transform: translate(-50%, -50%);
	  -ms-transform: translate(-50%, -50%);
	}
	
	* {
	  -webkit-box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  box-sizing: border-box;
	  margin: 0;
	  padding: 0;
	  text-decoration: none;
	  list-style-type: none;
	  outline: none;
	
	  &:after, &::before {
	    -webkit-box-sizing: border-box;
	    -moz-box-sizing: border-box;
	    box-sizing: border-box;
	    margin: 0;
	    padding: 0;
	    text-decoration: none;
	    list-style-type: none;
	    outline: none;
	  }
	}
	
	/* 슬라이드 메뉴가 분홍색으로 변할 때 */
	.side-menu.pink {
	  background-color: #ED2553; /* 분홍색 */
	}
	

  </style>
  <script type="text/javascript">
  	document.addEventListener("DOMContentLoaded", function() {
    	// 햄버거 버튼 클릭 시 메뉴와 배경 토글
    	function toggleSidebar() {
   	  	const menu = document.querySelector(".menu");
    		const sideMenu = document.querySelector(".side-menu");
        const overlay = document.querySelector(".overlay");

	        // 햄버거 아이콘과 메뉴 상태를 토글
        menu.classList.toggle("active");
        sideMenu.classList.toggle("open");
        overlay.classList.toggle("active");
	    }

	    // 배경 클릭 시 메뉴 닫기
	    document.querySelector(".overlay").addEventListener("click", function() {
        const menu = document.querySelector(".menu");
        const sideMenu = document.querySelector(".side-menu");
        const overlay = document.querySelector(".overlay");

	        // 메뉴와 배경 숨기기
        menu.classList.remove("active");
        sideMenu.classList.remove("open");
        overlay.classList.remove("active");
	    });

	    // 네비게이션바 고정 처리 (스크롤에 따라)
	    const navbar = document.querySelector("#navbar");
	    document.addEventListener("scroll", () => {
        const scrollY = window.scrollY;
        if (scrollY > 40) {
    	    navbar.classList.add("fixed");
        } else {
          navbar.classList.remove("fixed");
        }
	    });

	    // 햄버거 버튼 클릭 시 메뉴 열고 닫기
	    const menuButton = document.querySelector(".menu");
	    if (menuButton) {
        menuButton.addEventListener("click", toggleSidebar);
	    }

	    // 로그인 창 내 + 버튼 클릭 시 슬라이드 메뉴 색상 변경
	    window.toggleSidebarColor = function() {
        const sideMenu = document.querySelector(".side-menu");
        sideMenu.classList.toggle("pink");  // 슬라이드 메뉴 바 색상 토글
	    };
	});


  
  // 로그인 창 jsp
  $(function() {
	   $(".button").click(function(e) {
	      var pX = e.pageX,
	         pY = e.pageY,
	         oX = parseInt($(this).offset().left),
	         oY = parseInt($(this).offset().top);

	      $(this).append('<span class="click-efect x-' + oX + ' y-' + oY + '" style="margin-left:' + (pX - oX) + 'px;margin-top:' + (pY - oY) + 'px;"></span>')
	      $('.x-' + oX + '.y-' + oY + '').animate({
	         "width": "500px",
	         "height": "500px",
	         "top": "-250px",
	         "left": "-250px",

	      }, 600);
	      $("button", this).addClass('active');
	   })

	   $(".alt-2").click(function() {
	      if (!$(this).hasClass('material-button')) {
	         $(".shape").css({
	            "width": "100%",
	            "height": "100%",
	            "transform": "rotate(0deg)"
	         })

	         setTimeout(function() {
	            $(".overbox").css({
	               "overflow": "initial"
	            })
	         }, 600)


	         $(".overbox .title").fadeOut(300);
	         $(".overbox .input").fadeOut(300);
	         $(".overbox .button").fadeOut(300);

	         $(".alt-2").addClass('material-buton');
	      }

	   })

	   $(".material-button").click(function() {

	      if ($(this).hasClass('material-button')) {
	         setTimeout(function() {
	            $(".overbox").css({
	               "overflow": "hidden"
	            })
	            $(".box").addClass("back");
	         }, 200)
	         $(this).addClass('active').animate({
	            "width": "700px",
	            "height": "700px"
	         });
	         setTimeout(function() {
	            $(".shape").css({
	               "width": "50%",
	               "height": "50%",
	               "transform": "rotate(45deg)"
	            })
	         }, 700)
	         $(this).removeClass('material-button');
	      }

	      /* if ($(".alt-2").hasClass('material-buton')) {
	         $(".alt-2").removeClass('material-buton');
	         $(".alt-2").addClass('material-button');
	      } */
	   });
	});
</script>

</head>
<body>
  <header class="header-area header-sticky wow slideInDown animated" data-wow-duration="0.75s" data-wow-delay="0s">
    <div class="row">
      <nav class="main-nav" id="navbar">
        <a href="#" class="Logo" style="padding-left: 3.6%; padding-right: 0">GRINTERIOR</a>
        <ul class="nav" style="padding-top:0.5%; padding-left:5%; padding-right: 30%;">
          <li class="nav_menu"><a href="#" class="active">인테리어</a></li>
          <li class="nav_menu" style="padding: 0 50px;"><a href="#">가구</a></li>
          <li class="nav_menu"><a href="#">컨설팅 사례</a></li>
        </ul>
        <ul class="nav" style="padding-top:0.5%; padding-right: 3%;">
          <li><a href="#"><i class="fa-solid fa-magnifying-glass fa-lg"></i></a></li>
          <li><a href="#" style="padding: 0 20px;"><i class="fa-solid fa-cart-shopping fa-lg"></i></a></li>
          <li><a href="#" style="padding-right:20px;"><i class="fa-regular fa-heart fa-lg"></i></a></li>
          <li>
            <div class="pv-box">
              <div class="container" style="padding-left: 5px;">
                <div class="menu menu-icon" onclick="toggleSidebar()">
                  <div class="bar"></div>
                  <div class="bar"></div>
                  <div class="bar"></div>
                </div>
              </div>
            </div>
          </li>
        </ul>
      </nav>
    </div>
  </header>

  <div class="overlay"></div>

  <div class="side-menu">
  	<div class="materialContainer">
		  <div class="box">
	    	<div class="title">LOGIN</div>
		    <div class="input">
		       <label for="name">ID</label>
		       <input type="text" name="name" id="name">
		       <span class="spin"></span>
		    </div>
		    <div class="input">
		       <label for="pass">Password</label>
		       <input type="password" name="pass" id="pass">
		       <span class="spin"></span>
		    </div>
		    <div class="button login">
		       <button><span>LOGIN</span> <i class="fa fa-check"></i></button>
		    </div>
		    <a href="" class="pass-forgot">비밀번호를 잊어버리셨습니까?</a>
		 	</div>
   	
		  <div class="material-button alt-2" onclick="toggleSidebarColor()">
			  <span class="shape"></span>
			</div>
		</div>
  </div>

</body>
</html>