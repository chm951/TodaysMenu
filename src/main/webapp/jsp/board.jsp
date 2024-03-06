<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.todaysmenu.model.MemberVO"%>
<%@page import="com.todaysmenu.db.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.todaysmenu.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>레시피 저장소</title>
    <link rel="stylesheet" href="../resources/css/setting.css">
    <link rel="stylesheet" href="../resources/css/plugin.css">
    <link rel="stylesheet" href="../resources/css/template.css">
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/style.css">
</head>

<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">
    <header class="hooms-N55" data-bid="uClqa8c34N">
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

        <div class="hooms-N36" data-bid="uqlQA9EIsb">
            <div class="contents-inner">
                <div class="contents-container container-md">
                    <div class="textset textset-h2">
                        <h2 class="textset-tit">레시피 저장소</h2>
                    </div>

                    <div class="contents-search">
                        <p class="contents-result"> 전체<span> ${boards.size() }</span>개 </p>
                        <div class="contents-form">
                            <div class="selectset selectset-lg">

                                <ul class="selectset-list">
                                    <li class="selectset-item">
                                        <button class="selectset-link btn" type="button" data-value="전체">
                                            <span>전체</span>
                                        </button>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </div>
                    <div class="tableset">

                        <table class="tableset-table table">
                            <colgroup>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                            </colgroup>
                            <thead class="thead-light thead-border-top">
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">등록일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="b" items="${currBList}">
                                    <tr>
                                        <td class="tableset-mobile"> ${b.b_idx} </td>
                                        <td class="tableset-tit tableset-order02"><a class="tableset-ico"
                                                href="Goboard_write.do?num=${b.b_num}"> <span>${b.b_title}</span></a>
                                        </td>
                                        <td class="tableset-order05"> ${b.created_at}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <nav class="pagiset pagiset-line">
                        <c:choose>
                            <c:when test="${Bpage != 1 }">
                                <div class="pagiset-ctrl">
                                    <a class="pagiset-link pagiset-first" href="BoardSelect.do?page=1">
                                        <span class="visually-hidden">처음</span>
                                    </a>
                                </div>
                                <div class="pagiset-ctrl">
                                    <a class="pagiset-link pagiset-prev" href="BoardSelect.do?page=${Bpage - 1}">
                                        <span class="visually-hidden">이전</span>
                                    </a>
                                </div>
                            </c:when>
                            <c:otherwise>
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
                            </c:otherwise>
                        </c:choose>
                        <div class="pagiset-list">
                            <c:forEach begin="${startPage }" end="${endPage }" var="i">
                                <c:choose>
                                    <c:when test="${i == Bpage }">
                                        <a class="pagiset-link active-fill" href="BoardSelect.do?page=${i }">${i}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="pagiset-link" href="BoardSelect.do?page=${i }">${i}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </div>
                        <c:choose>
                            <c:when test="${Bpage != totalPages }">
                                <div class="pagiset-ctrl">
                                    <a class="pagiset-link pagiset-next" href="BoardSelect.do?page=${Bpage + 1}">
                                        <span class="visually-hidden">다음</span>
                                    </a>
                                </div>
                                <div class="pagiset-ctrl">
                                    <a class="pagiset-link pagiset-last" href="BoardSelect.do?page=${totalPages }">
                                        <span class="visually-hidden">마지막</span>
                                    </a>
                                </div>
                            </c:when>
                            <c:otherwise>
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
                            </c:otherwise>
                        </c:choose>
                    </nav>
                </div>
            </div>

        </div>
        <div class="hooms-N2" data-bid="BELqA89V59">
        </div>
        <div class="hooms-N58" data-bid="jqlQA89v69">
            <div class="contents-container container-md">
                <div class="tabset tabset-solid">
                </div>
            </div>
        </div>
        <div class="hooms-N38" data-bid="uiLQa89v6x">
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