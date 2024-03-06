<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="../resources/css/setting.css">
    <link rel="stylesheet" href="../resources/css/plugin.css">
    <link rel="stylesheet" href="../resources/css/template.css">
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/style.css">
</head>

<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">
    <header class="hooms-N55" data-bid="NylqA8BvLM">
        <div class="header-container container-lg">
            <div class="header-left">
                <h1 class="header-title">
                    <a class="header-logo" href="Gomain.do" title="홈"></a>
                </h1>
            </div>
        </div>
        <div class="header-dim"></div>
    </header>
    <main class="th-layout-main ">
        <div class="hooms-N52" data-bid="PhlQA8bVNV">
            <div class="contents-inner">
                <div class="contents-container">
                    <div class="textset textset-h2">
                        <h2 class="textset-tit">로그인</h2>
                        <p class="textset-desc">오늘의 메뉴를 방문해주셔서 감사합니다.</p>
                    </div>

                    <form method="post">
                        <div class="contents-form">
                            <div class="inputset inputset-lg inputset-label">
                                <label>
                                    <h6 class="inputset-tit">아이디</h6>
                                    <input id="user_id" type="text" class="inputset-input form-control"
                                        placeholder="아이디를 입력해주세요." aria-label="내용">
                                </label>
                            </div>
                            <div class="inputset inputset-lg inputset-label">
                                <label>
                                    <h6 class="inputset-tit">비밀번호</h6>
                                    <input id="user_pw" type="password" class="inputset-input form-control"
                                        placeholder="비밀번호를 입력해주세요." aria-label="내용">
                                </label>
                            </div>
                            <button id="login" type="button" class="btnset btnset-lg">로그인</button>
                        </div>
                    </form>

                    <ul class="contents-list">
                        <li class="contents-item">
                            <a href="Gointro.do" class="contents-link">첫 화면으로</a>
                        </li>
                        <li class="contents-item">
                            <a href="GoJoin.do" class="contents-link">회원가입</a>
                        </li>
                    </ul>
                    <div class="contents-start">
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
    </script>
    <script>
        $('#login').click(function () {
            var user_id = $("#user_id").val();
            var user_pw = $("#user_pw").val();
            $.ajax({
                url: "Login.do",
                data: { 'user_id': user_id, 'user_pw': user_pw },
                type: 'post',
                success: function (data) {
                    if (data == 'false') {
                        alert('아이디 또는 비밀번호가 잘못되었습니다')
                    } else {
                        location.href = "Gomain.do"
                    }
                }
            });
        })

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