<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>캘린더</title>
    <link rel="stylesheet" href="../resources/css/setting.css">
    <link rel="stylesheet" href="../resources/css/plugin.css">
    <link rel="stylesheet" href="../resources/css/template.css">
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/style.css">

    <link href='./main.css' rel='stylesheet' />
    <script src='./main.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>

<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">
    <header class="hooms-N55" data-bid="uClqa8c34N">
        <div class="header-inner">
            <div class="header-container container-lg">
                <div class="header-left">
                    <h1 class="header-title">
                        <a class="header-logo" href="Gomain.do" title="홈"></a>
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
                        <li class="header-gnbitem">
                            <c:if test="${member != null }">
                                <a class="header-gnblink" href="BoardSelect.do">
                                    <span>레시피 저장소</span>
                                </a>
                            </c:if>
                            <c:if test="${member == null }">
                                <a class="header-gnblink" onclick="loginPLZ()">
                                    <span>레시피 저장소</span>
                                </a>
                            </c:if>
                        </li>
                        </li>
                        <li class="header-gnbitem">
                            <a class="header-gnblink" href="Youtube.do">
                                <span>레시피 영상</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="header-right">
                    <c:if test="${member == null }">
                        <div class="header-utils">
                            <a href="Gologin.do" class="btn-profile header-utils-btn" title="로그인"></a>
                            <button class="btn-close header-utils-btn" title="close"></button>
                        </div>
                    </c:if>
                    <c:if test="${member != null }">
                        <div class="header-utils">
                            <a href="Gomypage.do" class="btn-profile header-utils-btn" title="마이페이지"></a>
                            <button class="btn-close header-utils-btn" title="close"></button>
                        </div>
                        <div class="header-utils">
                            <a href="Logout.do" class="btn-search header-utils-btn" title="로그아웃"></a>
                            <button class="btn-close header-utils-btn" title="close"></button>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="header-dim"></div>
    </header>
    <main class="th-layout-main ">
        <div class="hooms-N32" data-bid="eOLqA9CiBF">
            <div class="contents-inner">
                <div class="contents-container container-md">
                    <div class="textset textset-h2">
                        <h2 class="textset-tit">Calendar</h2>
                    </div>
                    <div class="contents-group">
                    </div>
                    <div class="contents-cardlist contents-cardlist-active">
                        <figure class="cardset-figure">

                            <div id='calendar'></div>
                            <script>
                            var cnt =0;
                            var today = new Date();
                            function loginPLZ(){
                            	alert('로그인 후 이용이 가능합니다')
                            }
                            
                                document.addEventListener('DOMContentLoaded', function () {
                                    var calendarEl = document.getElementById('calendar');
                                    // new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2..})

                                    var now = new Date();
                                    var calendar = new FullCalendar.Calendar(calendarEl, {
                                        headerToolbar: {
                                            left: 'prev,next today',
                                            center: 'title',
                                            right: 'dayGridMonth,timeGridWeek,timeGridDay'
                                        },

                                        initialDate: today, // 초기 로딩 날짜.

                                        navLinks: true, // can click day/week names to navigate views
                                        selectable: true,
                                        selectMirror: true,
                                        // 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
                                        select: function (arg) {

                                            var title = prompt('입력할 일정:');
                                            // title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
                                            if (title) {
                                                calendar.addEvent({
                                                    title: title,
                                                    start: arg.start,
                                                    end: arg.end,
                                                    allDay: arg.allDay,
                                                    backgroundColor: "white",
                                                    textColor: "black"
                                               })
                                            }
                                            calendar.unselect()
                                        },
                                        eventClick: function (arg) {

                                            if (confirm('일정을 삭제하시겠습니까?')) {
                                                arg.event.remove()
                                            }
                                        },
                                        editable: true,
                                        dayMaxEvents: true, // allow "more" link when too many events
                                        events: {
                                            ///CalendarController.do
                                            url: 'CalendarController.do',
                                            method: 'GET',
                                            success: function (data) {

                                            },
                                            failure: function () {
                                                // 데이터 가져오기에 실패한 경우의 처리
                                            }
                                        }
                                        ,

                                    });

                                    calendar.render();
                                });

                            </script>


                        </figure>
                    </div>

                </div>
            </div>
        </div>
        <div class="hooms-N2" data-bid="qklQa88OMk">

        </div>
        <div class="hooms-N58" data-bid="gnlQa88oN3">
            <div class="contents-container container-md">
                <div class="tabset tabset-solid">
                </div>
            </div>
        </div>
        <div class="hooms-N32" data-bid="Hylqa88oNP">
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