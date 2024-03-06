<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원가입 완료</title>
  
  <link rel="stylesheet" href="../resources/css/setting.css">
  <link rel="stylesheet" href="../resources/css/plugin.css">
  <link rel="stylesheet" href="../resources/css/template.css">
  <link rel="stylesheet" href="../resources/css/common.css">
  <link rel="stylesheet" href="../resources/css/style.css"></head>

<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">
  <header class="hooms-N55" data-bid="EUlQAie9qD">
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
          
        </div>
      </div>
     
    </div>

    <div class="header-dim"></div>
  </header>
  <main class="th-layout-main ">
    <div class="hooms-N51" data-bid="mdLqaIe9t0">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="contents-ico">
            <figure class="contents-figure">
              <img class="cardset-img" src="../resources/icons/ico_check.svg" alt="웰컴 아이콘">
            </figure>
          </div>
          <div class="textset textset-h2">
            <h2 class="textset-tit">Welcome!<p></p>
            </h2>
          </div>
          <p class="contents-message">오늘의 메뉴 회원이 되신 것을 환영합니다.</p>
          <div class="contents-btn">
            <a href="Gologin.do" class="btnset btnset-lg">로그인하러 가기</a>
          </div>
        </div>
      </div>
    </div>
  </main>

  <script src="../resources/js/setting.js"></script>
  <script src="../resources/js/plugin.js"></script>
  <script src="../resources/js/template.js"></script>
  <script src="../resources/js/common.js"></script>
  <script src="../resources/js/script.js"></script>
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