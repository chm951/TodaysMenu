<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.todaysmenu.model.YoutubeVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>레시피 영상</title>
    <link rel="stylesheet" href="../resources/css/setting.css">
    <link rel="stylesheet" href="../resources/css/plugin.css">
    <link rel="stylesheet" href="../resources/css/template.css">
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/style.css">
</head>

<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">
    <%
    HttpSession sessions = request.getSession();
    List<YoutubeVO> currentPageList = (List<YoutubeVO>) sessions.getAttribute("currentPageList");
    List<YoutubeVO> youtube = (List<YoutubeVO>) sessions.getAttribute("youtube");
    int pages = (int)sessions.getAttribute("page");
    String youtube_name = (String)sessions.getAttribute("youtube_name");
	%>
	<%
	int totalDataCount = youtube.size();
	
	int pageSize = 20;
	
	int totalPages = (int) Math.ceil((double) totalDataCount / pageSize);
	%>
                       <header class="hooms-N55" data-bid="uClqa8c34N" id="">
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

                </li>
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

    <div class="header-dim"></div>
</header>
<main class="th-layout-main ">
    <div class="hooms-N2" data-bid="GtlqA8bBNE" id="">
    </div>
    <div class="hooms-N58" data-bid="lQlQA8bbo0" id="">
        <div class="contents-container container-md">
            <div class="tabset tabset-solid">
            </div>
        </div>
    </div>
    <div class="hooms-N31" data-bid="OtLQa8BBoj">
        <div class="contents-inner">
            <div class="contents-container container-md">
                <div class="textset textset-h2">
                    <h2 class="textset-tit">유튜브 레시피 영상</h2>
                </div>
                <div class="tabset tabset-brick">
                    <ul class="tabset-list tabset-sm tabset-fill">
                        <li class="tabset-item">
                            <a class="tabset-link" href="Youtube.do?youtube_name=뚝딱이형">
                                <span>뚝딱이형</span>
                            </a>
                        </li>
                        <li class="tabset-item">
                            <a class="tabset-link" href="Youtube.do?youtube_name=자취의신">
                                <span>자취의신</span>
                            </a>
                        </li>
                        <li class="tabset-item">
                            <a class="tabset-link" href="Youtube.do?youtube_name=백종원">
                                <span>백종원의 쿠킹로그</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="contents-search">
                    <p class="contents-result"> 전체<span> ${youtube.size()}</span>개 </p>
                </div>
                <div class="contents-group">
                    <div class="contents-cardlist contents-cardlist-active">
                        <c:forEach var="item" items="${currentPageList}">
                            <a href=${item.getYoutube_url() } target="_blank" class="cardset">
                                <figure class="cardset-figure">
                                    <img class="cardset-img" src="${item.getYoutube_img() }" alt="이미지">
                                </figure>
                                <div class="cardset-body">
                                    <h5 class="cardset-tit">${item.getYoutube_title()}</h5>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
                <nav class="pagiset pagiset-line">
                    <% if(pages!=1){ %>
                        <div class="pagiset-ctrl">
                            <a class="pagiset-link pagiset-first"
                                href="Youtube.do?page=1&youtube_name=<%=youtube_name%>">
                                <span class="visually-hidden">처음</span>
                            </a>
                        </div>

                        <div class="pagiset-ctrl">
                            <a class="pagiset-link pagiset-prev"
                                href="Youtube.do?page=<%=pages-1%>&youtube_name=<%=youtube_name%>">
                                <span class="visually-hidden">이전</span>
                            </a>
                        </div>
                        <%}else{ %>
                            <div class="pagiset-ctrl">
                                <p class="pagiset-link pagiset-first">
                                    <span class="visually-hidden">처음</span>
                                </p>
                            </div>

                            <div class="pagiset-ctrl">
                                <p class="pagiset-link pagiset-prev">
                                    <span class="visually-hidden">이전</span>
                                </p>
                            </div>
                            <%} %>
                                <div class="pagiset-list">
                                    <c:forEach begin="1" end="<%=totalPages%>" var="pageNumber">
                                        <c:choose>
                                            <c:when test="${pageNumber == page }">
                                                <a class="pagiset-link active-fill"
                                                    href="Youtube.do?page=${pageNumber}&youtube_name=<%=youtube_name%>">${pageNumber}</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a class="pagiset-link"
                                                    href="Youtube.do?page=${pageNumber}&youtube_name=<%=youtube_name%>">${pageNumber}</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </div>
                                <% if(pages!=totalPages){ %>
                                    <div class="pagiset-ctrl">
                                        <a class="pagiset-link pagiset-next"
                                            href="Youtube.do?page=<%=pages+1%>&youtube_name=<%=youtube_name%>">
                                            <span class="visually-hidden">다음</span>
                                        </a>
                                    </div>
                                    <div class="pagiset-ctrl">
                                        <a class="pagiset-link pagiset-last"
                                            href="Youtube.do?page=<%=totalPages%>&youtube_name=<%=youtube_name%>">
                                            <span class="visually-hidden">마지막</span>
                                        </a>
                                    </div>
                                    <%} else{%>
                                        <div class="pagiset-ctrl">
                                            <p class="pagiset-link pagiset-next">
                                                <span class="visually-hidden">다음</span>
                                            </p>
                                        </div>
                                        <div class="pagiset-ctrl">
                                            <p class="pagiset-link pagiset-last">
                                                <span class="visually-hidden">마지막</span>
                                            </p>
                                        </div>
                                        <%} %>
                </nav>
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
    function loginPLZ() {
        alert('로그인 후 이용이 가능합니다')
    }
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