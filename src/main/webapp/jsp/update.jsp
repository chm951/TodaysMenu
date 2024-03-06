<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>내 정보 수정</title>
    <link rel="stylesheet" href="../resources/css/setting.css">
    <link rel="stylesheet" href="../resources/css/plugin.css">
    <link rel="stylesheet" href="../resources/css/template.css">
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/style.css">
</head>

<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">
    <header class="hooms-N55" data-bid="uClqa8c34N" id="">
        <div class="header-container container-lg">
            <div class="header-left">
                <h1 class="header-title">
                    <a class="header-logo" href="Gomain.do" title="hooms"></a>
                </h1>
            </div>
            <div class="header-center">
                <ul class="header-gnblist">
                    <li class="header-gnbitem">
                        <a class="header-gnblink" href="Gocalendar.do">
                            <span>캘린더</span>
                        </a>

                    </li>
                    <li class="header-gnbitem">
                        <a class="header-gnblink" href="Gomain.do">
                            <span>AI 식단 추천</span>
                        </a>

                    </li>
                    <li class="header-gnbitem">
                        <a class="header-gnblink" href="BoardSelect.do">
                            <span>레시피 저장소</span>
                        </a>
                    </li>
                    <li class="header-gnbitem">
                        <a class="header-gnblink" href="Youtube.do">
                            <span>레시피 영상</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="header-right">
                <div class="header-utils">
                    <a href="Gomypage.do" class="btn-profile header-utils-btn" title="마이페이지"></a>
                    <button class="btn-close header-utils-btn" title="close"></button>
                </div>
                <div class="header-utils">
                    <a href="Logout.do" class="btn-search header-utils-btn" title="로그아웃"></a>
                    <button class="btn-close header-utils-btn" title="close"></button>
                </div>
            </div>

        </div>

        <div class="header-dim"></div>
    </header>
    <main class="th-layout-main ">
        <div class="hooms-N53" data-bid="mhLq6d34I5" id="">
            <div class="contents-inner">
                <div class="contents-container">
                    <div class="textset textset-h2">
                        <h2 class="textset-tit">내 정보 수정</h2>
                    </div>
                    <form action="Update.do" method="post">
                        <div class="contents-form">
                            <div class="contents-form-bottom">

                                <div class="inputset inputset-lg inputset-label">
                                    <label>
                                        <h6 class="inputset-tit"> 비밀번호
                                        </h6>
                                        <input type="password" name="pw" class="inputset-input form-control"
                                            placeholder="변경하실 비밀번호를 입력해 주세요." aria-label="내용" required="">
                                    </label>
                                </div>
                                <div class="inputset inputset-lg inputset-label">
                                    <label>
                                        <h6 class="inputset-tit"> 이름
                                        </h6>
                                        <input type="text" name="name" class="inputset-input form-control"
                                            placeholder="홍길동" aria-label="내용" required="">
                                    </label>
                                </div>
                            </div>
                            <button class="btnset btnset-lg contents-submit">수정완료</button>
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