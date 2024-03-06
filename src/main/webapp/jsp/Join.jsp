<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원가입</title>
  <link rel="stylesheet" href="../resources/css/setting.css">
  <link rel="stylesheet" href="../resources/css/plugin.css">
  <link rel="stylesheet" href="../resources/css/template.css">
  <link rel="stylesheet" href="../resources/css/common.css">
  <link rel="stylesheet" href="../resources/css/style.css">
</head>

<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">
  <header class="hooms-N55" data-bid="uJLQ6D34F4">
    <div class="header-container container-lg">
      <div class="header-left">
        <h1 class="header-title">
          <a class="header-logo" href="Gomain.do" title="홈"></a>
        </h1>
      </div>
      <div class="header-center">
        
      </div>
      <div class="header-right">
        <div class="header-utils">
          <a href="login.jsp" class="btn-profile header-utils-btn"></a>
          <button class="btn-close header-utils-btn" title="close"></button>
        </div>
      </div>
      
    </div>
  
    <div class="header-dim"></div>
  </header>
  <main class="th-layout-main ">
    <div class="hooms-N53" data-bid="mhLq6d34I5">
      <div class="contents-inner">
        <div class="contents-container">
          <div class="textset textset-h2">
            <h2 class="textset-tit">회원가입</h2>
          </div>
          
          
          <form action="Join.do" method="post">
          <div class="contents-form">
            <div class="contents-form-bottom">
              <div class="inputset inputset-lg inputset-label">
                <label>
                  <h6 class="inputset-tit"> 아이디<span>*</span>
                  </h6>
                  <input name="user_id" id="inputI" type="text" class="inputset-input form-control" placeholder="사용하실 아이디를 입력해 주세요."
                    aria-label="내용">
                </label>
                <button id="checkButton" class="btnset btnset-line btnset-lg" onclick="checkI()">중복확인</button>
              </div>
              <span id="resultCheck"></span>
              <div class="inputset inputset-lg inputset-label">
                <label>
                  <h6 class="inputset-tit"> 비밀번호<span>*</span>
                  </h6>
                  <input name="user_pw" type="password" class="inputset-input form-control" placeholder="사용하실 비밀번호를 입력해 주세요."
                    aria-label="내용" required="">
                </label>
              </div>
              <div class="inputset inputset-lg inputset-label">
                <label>
                  <h6 class="inputset-tit"> 이름<span>*</span>
                  </h6>
                  <input name="user_name" type="text" class="inputset-input form-control" placeholder="이름을 입력해주세요." aria-label="내용"
                    required="">
                </label>
              </div>
              <div class="inputset inputset-lg inputset-label">
                <label>
                  <h6 class="inputset-tit"> 생년월일<span>*</span>
                  </h6>
                  <input name="user_birthdate" type="date" class="inputset-input form-control" placeholder="숫자로 입력해주세요." aria-label="내용"
                    required="">
                </label>
              </div>
              <div class="inputset inputset-lg inputset-label">
                <label>
                  <h6 class="inputset-tit"> 성별<span>*</span>
                  </h6>
                    남자 <input type="radio" name="user_gender" value="M">
                    여자 <input type="radio" name="user_gender" value="F">
                  </h6>
                </label>
              </div>
            </div>
          </div>
          <input type="submit" value="가입하기" class="btnset btnset-lg contents-submit">
          </form>
          
        </div>
      </div>
    </div>
  </main>
 
  <script src="../resources/js/setting.js"></script>
  <script src="../resources/js/plugin.js"></script>
  <script src="../resources/js/template.js"></script>
  <script src="../resources/js/common.js"></script>
  <script src="../resources/js/script.js"></script>
   <script src="jquery-3.7.1.min.js"></script>
 <!-- Jquery -->
 <script>
	    $('#checkButton').click(function(event) {
	        event.preventDefault(); // 폼 제출 방지
	        checkDuplicate(); // 중복 확인 함수 호출
	    });


	function checkDuplicate() {
	    var inputI = $("#inputI").val();
	    $.ajax({
	        url : 'IdCheck.do',
	        data : {'inputI':inputI},
	        type : 'get',
	        success: function(data){
	            if(data =='true'){
	                $('#resultCheck').text('이미 사용 중인 아이디입니다').css('color', 'red')
	            } else if (data =='false'){
	                $('#resultCheck').text('사용할 수 있는 아이디입니다').css('color', 'blue')
	            }   
	        },
	        error : function(){
	            alert('통신실패');
	        }
	    });
	}
	</script>
  <script>
    if ('WebSocket' in window) {
      (function () {
        function refreshCSS() {
          var sheets = [].slice.call(document.getElementsByTagName("link"));
          var head = document.getElementsByTagName("head")[0];
          for (var i = 0; i < sheets.length; ++i) {
            var elem = sheets[i];
            var parent = elem.parentElement || head;
            parent.removeChild(elem);
            var rel = elem.rel;
            if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
              var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
              elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
            }
            parent.appendChild(elem);
          }
        }
        var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
        var address = protocol + window.location.host + window.location.pathname + '/ws';
        var socket = new WebSocket(address);
        socket.onmessage = function (msg) {
          if (msg.data == 'reload') window.location.reload();
          else if (msg.data == 'refreshcss') refreshCSS();
        };
        if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
          console.log('Live reload enabled.');
          sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
        }
      })();
    }
    else {
      console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
    }
  </script> 
</body>
</html>