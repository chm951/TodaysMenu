<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>AI 추천 서비스</title>
    <link rel="stylesheet" href="../resources/css/setting.css">
    <link rel="stylesheet" href="../resources/css/plugin.css">
    <link rel="stylesheet" href="../resources/css/template.css">
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/style.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        #loading {
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            position: fixed;
            display: block;
            opacity: 0.6;
            background: #e4e4e4;
            z-index: 99;
            text-align: center;
        }

        #loading>img {
            position: absolute;
            top: 40%;
            left: 45%;
            z-index: 100;
        }

        #loading>p {
            position: absolute;
            top: 57%;
            left: 43%;
            z-index: 101;
        }

        #blank_area {
            height: 200px;
        }

        #keyword_area {
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            justify-content: space-evenly;
            align-items: center
        }

        #keyword_area2 {}

        form>div {
            margin: auto;
            max-width: 50rem;
            text-align: left;
        }

        #keybox_purpose,
        #keybox_ingre1,
        #keybox_ingre2,
        #keybox_style {
            margin: 50px;
        }

        .keyword_purpose,
        .keyword_ingre1,
        .keyword_ingre2,
        .keyword_style {
            width: 180px;
            height: 40px;
            color: #fff;
            border-radius: 5px;
            padding: 10px 25px;
            font-weight: 500;
            background: transparent;
            background-color: rgb(245, 245, 245);
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
            box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5),
                7px 7px 20px 0px rgba(0, 0, 0, .1),
                4px 4px 5px 0px rgba(0, 0, 0, .1);
            outline: none;
            border: none;
            color: #000;
        }


        .keyword_purpose :after {
            position: absolute;
            content: "";
            width: 0;
            height: 100%;
            top: 0;
            left: 0;
            direction: rtl;
            z-index: -1;
            box-shadow:
                -7px -7px 20px 0px #fff9,
                -4px -4px 5px 0px #fff9,
                7px 7px 20px 0px #0002,
                4px 4px 5px 0px #0001;
            transition: all 0.3s ease;
        }

        .keyword_ingre1 :after {
            position: absolute;
            content: "";
            width: 0;
            height: 100%;
            top: 0;
            left: 0;
            direction: rtl;
            z-index: -1;
            box-shadow:
                -7px -7px 20px 0px #fff9,
                -4px -4px 5px 0px #fff9,
                7px 7px 20px 0px #0002,
                4px 4px 5px 0px #0001;
            transition: all 0.3s ease;
        }

        .keyword_ingre2 :after {
            position: absolute;
            content: "";
            width: 0;
            height: 100%;
            top: 0;
            left: 0;
            direction: rtl;
            z-index: -1;
            box-shadow:
                -7px -7px 20px 0px #fff9,
                -4px -4px 5px 0px #fff9,
                7px 7px 20px 0px #0002,
                4px 4px 5px 0px #0001;
            transition: all 0.3s ease;
        }

        .keyword_style :after {
            position: absolute;
            content: "";
            width: 0;
            height: 100%;
            top: 0;
            left: 0;
            direction: rtl;
            z-index: -1;
            box-shadow:
                -7px -7px 20px 0px #fff9,
                -4px -4px 5px 0px #fff9,
                7px 7px 20px 0px #0002,
                4px 4px 5px 0px #0001;
            transition: all 0.3s ease;
        }

        .keyword_purpose :hover {
            color: #000;
        }

        .keyword_ingre1 :hover {
            color: #000;
        }

        .keyword_ingre2 :hover {
            color: #000;
        }

        .keyword_style :hover {
            color: #000;
        }

        .keyword_purpose :hover:after {
            left: auto;
            right: 0;
            width: 100%;
        }

        .keyword_ingre1 :hover:after {
            left: auto;
            right: 0;
            width: 100%;
        }

        .keyword_ingre2 :hover:after {
            left: auto;
            right: 0;
            width: 100%;
        }

        .keyword_style :hover:after {
            left: auto;
            right: 0;
            width: 100%;
        }

        .keyword_purpose :active {
            top: 2px;
        }

        .keyword_ingre1 :active {
            top: 2px;
        }

        .keyword_ingre2 :active {
            top: 2px;
        }

        .keyword_style :active {
            top: 2px;
        }

        .key_title {
            background-color: rgb(80, 80, 80);
            width: 180px;
            height: 40px;
            color: #fff;
            border-radius: 5px;
            padding: 10px 25px;
            font-weight: 500 cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
            box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5),
                7px 7px 20px 0px rgba(0, 0, 0, .1),
                4px 4px 5px 0px rgba(0, 0, 0, .1);
            outline: none;
            border: none;
        }

        #btn_click {
            box-shadow: -5px -5px 10px #fff, 5px 5px 8px #babebc;
            border-radius: 20px;
            border: none;
            outline: none;
            font-size: 13px;
            font-weight: bold;
            padding: 10px 30px;
            margin: 14px;
            letter-spacing: 1px;
            text-transform: uppercase;
            cursor: pointer;
            transition: transform 80ms ease-in;
            background-color: rgb(245, 245, 245);

        }

        #btn_click:active {
            box-shadow: inset 1px 1px 2px #babebc, inset -1px -1px 2px #fff;
        }

        #btn_click2 {
            box-shadow: -5px -5px 10px #fff, 5px 5px 8px #babebc;
            border-radius: 20px;
            border: none;
            outline: none;
            font-size: 13px;
            font-weight: bold;
            padding: 10px 30px;
            margin: 14px;
            letter-spacing: 1px;
            text-transform: uppercase;
            cursor: pointer;
            transition: transform 80ms ease-in;
            background-color: rgb(245, 245, 245);

        }

        #btn_click2:active {
            box-shadow: inset 1px 1px 2px #babebc, inset -1px -1px 2px #fff;
        }

        .i1 {
            display: none;
        }

        .i1:checked+label {
            background-color: gray;
            color: white;
        }
    </style>

</head>

<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">
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
    <main class="th-layout-main th-layout-side">

        <div class="th-layout-content">
            <div class="hooms-N37" data-bid="goLqA8AT7W" id="">
                <div class="contents-inner">
                    <div class="contents-container container-md">
                        <div class="textset textset-h2">
                            <h2 class="textset-tit">AI 식단 추천</h2>
                        </div>

                        <div class="contents-group">
                            <div class="contents-group-top">
                    </div>
                </div>
            </div>
            
            <div id="keyword_area">

                <div align="center" id="keyword_area2">
                    <div id="keybox_purpose">
                        <span class="key_title">목적</span><br><br>
                        <input type="checkbox" value="체중감소" id="체중감소" class="i1">
                        <label for="체중감소" class="keyword_purpose">체중감소</label>
                        <input type="checkbox" value="체중증가" id="체중증가" class="i1">
                        <label for="체중증가" class="keyword_purpose">체중증가</label>
                        <input type="checkbox" value="저당식" id="저당식" class="i1">
                        <label for="저당식" class="keyword_purpose">저당식</label>
                        <input type="checkbox" value="저염식" id="저염식" class="i1">
                        <label for="저염식" class="keyword_purpose">저염식</label>
                    </div>
                    <div id="keybox_ingre1">
                        <span class="key_title">피해야할 식재료</span><br><br>
                        <input type="checkbox" value="카페인" id="카페인" class="i1">
                        <label for="카페인" class="keyword_ingre1">카페인</label>
                        <input type="checkbox" value="샐러리" id="샐러리" class="i1">
                        <label for="샐러리" class="keyword_ingre1">샐러리</label>
                        <input type="checkbox" value="갑각류" id="갑각류" class="i1">
                        <label for="갑각류" class="keyword_ingre1">갑각류</label>
                        <input type="checkbox" value="달걀" id="달걀" class="i1">
                        <label for="달걀" class="keyword_ingre1">달걀</label><br>
                        <input type="checkbox" value="생선" id="생선" class="i1">
                        <label for="생선" class="keyword_ingre1">생선</label>
                        <input type="checkbox" value="글루텐" id="글루텐" class="i1">
                        <label for="글루텐" class="keyword_ingre1">글루텐</label>
                        <input type="checkbox" value="땅콩" id="땅콩" class="i1">
                        <label for="땅콩" class="keyword_ingre1">땅콩</label>
                        <input type="checkbox" value="우유" id="우유" class="i1">
                        <label for="우유" class="keyword_ingre1">우유</label>
                    </div>
                    <div id="keybox_ingre2">
                        <input type="checkbox" value="연체동물" class="i1" id="연체동물">
                        <label for="연체동물" class="keyword_ingre2">연체동물</label>
                        <input type="checkbox" value="겨자" class="i1" id="겨자">
                        <label for="겨자" class="keyword_ingre2">겨자</label>
                        <input type="checkbox" value="참깨" class="i1" id="참깨">
                        <label for="참깨" class="keyword_ingre2">참깨</label>
                        <input type="checkbox" value="대두" class="i1" id="대두">
                        <label for="대두" class="keyword_ingre2">대두</label><br>
                        <input type="checkbox" value="견과" class="i1" id="견과">
                        <label for="견과" class="keyword_ingre2">견과</label>
                        <input type="checkbox" value="밀" class="i1" id="밀">
                        <label for="밀" class="keyword_ingre2">밀</label>
                        <input type="checkbox" value="젖당" class="i1" id="젖당">
                        <label for="젖당" class="keyword_ingre2">젖당</label>
                        <input type="checkbox" value="이스트" class="i1" id="이스트">
                        <label for="이스트" class="keyword_ingre2">이스트</label><br>
                        <input type="checkbox" value="오트밀" class="i1" id="오트밀">
                        <label for="오트밀" class="keyword_ingre2">오트밀</label>
                        <input type="checkbox" value="닭가슴살" class="i1" id="닭가슴살">
                        <label for="닭가슴살" class="keyword_ingre2">닭가슴살</label>
                        <input type="checkbox" value="샐러드" class="i1" id="샐러드">
                        <label for="샐러드" class="keyword_ingre2">샐러드</label>
                        <input type="checkbox" value="아보카도" class="i1" id="아보카도">
                        <label for="아보카도" class="keyword_ingre2">아보카도</label>

                    </div>
                    <div id="keybox_style">
                        <span class="key_title">식단 스타일</span><br><br>
                        <input type="checkbox" value="비건식" class="i1" id="비건식">
                        <label for="비건식" class="keyword_style">비건식</label>
                        <input type="checkbox" value="키토제닉" class="i1" id="키토제닉">
                        <label for="키토제닉" class="keyword_style">키토제닉</label>
                        <input type="checkbox" value="저탄수화물" class="i1" id="저탄수화물">
                        <label for="저탄수화물" class="keyword_style">저탄수화물</label>
                        <input type="checkbox" value="글루텐프리" class="i1" id="글루텐프리">
                        <label for="글루텐프리" class="keyword_style">글루텐 프리</label>
                    </div>
                    <button id="btn_click" onclick="chatGPT()">추천받기</button>
                </div>
            </div>
            <div id="recommend" align="center">
                <form action="Filtering.do" method="post" id="filterForm" align="center">
                    <div id="result"></div>
                    <input type="hidden" id="keywords" name="keywords">
                    <c:if test="${member != null }">
                        <input type="submit" value="저장하기" id="btn_click2">
                    </c:if>
                    <c:if test="${member == null }">
                        <input type="submit" value="저장하기" id="btn_click2" onclick="return loginPLZ2()">
                    </c:if>
                </form>
                <div id="loading">
                    <img src="https://studentrights.sen.go.kr/images/common/loading.gif">
                </div>


                <script>
                    function loginPLZ() {
                        alert('로그인 후 이용이 가능합니다')
                    }
                    function loginPLZ2() {
                        alert('로그인 후 이용이 가능합니다')
                        return false;
                    }

                    $(document).ready(function () {
                        $('#loading').hide();
                        $('#filterForm input[type="submit"]').hide();
                    });

                    function chatGPT() {

                        const api_key = "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"

                        const purposeCheckboxes = document.querySelectorAll('#keybox_purpose input[type="checkbox"]:checked');
                        const ingre1Checkboxes = document.querySelectorAll('#keybox_ingre1 input[type="checkbox"]:checked');
                        const ingre2Checkboxes = document.querySelectorAll('#keybox_ingre2 input[type="checkbox"]:checked');
                        const styleCheckboxes = document.querySelectorAll('#keybox_style input[type="checkbox"]:checked');

                        const purposeValues = Array.from(purposeCheckboxes).map(checkbox => checkbox.value).join(', ');
                        const ingre1Values = Array.from(ingre1Checkboxes).map(checkbox => checkbox.value).join(', ');
                        const ingre2Values = Array.from(ingre2Checkboxes).map(checkbox => checkbox.value).join(', ');
                        const styleValues = Array.from(styleCheckboxes).map(checkbox => checkbox.value).join(', ');

                        $('#loading').show();

                        if (purposeValues.length === 0 && ingre1Values.length === 0 && ingre2Values.length === 0 && styleValues.length === 0) {
                            messages = [
                                { role: 'system', content: 'You are a helpful assistant' },
                                {
                                    role: 'user',
                                    content:
                                        '기본 : 아침, 점심, 저녁 각 한 번씩 메뉴를 추천해줘.' +
                                        '예시는 아침 : 1.음식명: ...(줄바꿈)\n,2.식재료: ...(줄바꿈)\n, 3.조리법 : ...(줄바꿈)\n, 점심 : ..., 저녁 : ...' +
                                        '식재료는 1인 기준 정량으로, 레시피는 꼭 자세히 알려줘 위의 음식명 한줄, 식재료 한줄, 조리법은 무조건 한줄로 추천해줘.그리고 무조건 총 12줄로만 답변해줘'
                                },
                            ];
                        } else {
                            messages = [
                                { role: 'system', content: 'You are a helpful assistant.' },
                                {
                                    role: 'user',
                                    content:
                                        '나의 목적은' + purposeValues + '이고, ' +
                                        '' + ingre1Values + ', ' + ingre2Values + '는 모두 제외하고, ' +
                                        '식단 스타일은 ' + styleValues + '이야. ' +
                                        '기본 : 아침, 점심, 저녁 각 한 번씩 메뉴를 추천해줘.' +
                                        '예시는 아침 : 1.음식명: ...(줄바꿈)\n, 2.식재료: ...(줄바꿈)\n, 3.조리법 : ...(줄바꿈)\n, 점심 : ..., 저녁 : ...' +
                                        '식재료는 1인 기준 정량으로, 레시피는 꼭 자세히 알려줘 위의 음식명 한줄, 식재료 한줄, 조리법은 무조건 한줄로 추천해줘. 그리고 전달해주는 내용은 무조건 총 12줄로만 답변해줘. 불필요한 멘트는 빼줘.'
                                },
                            ];
                        }
                        const data = {
                            model: 'gpt-3.5-turbo',
                            temperature: 0.5,
                            n: 1,
                            messages: messages,
                        }

                        $.ajax({
                            url: "https://api.openai.com/v1/chat/completions",
                            method: 'POST',
                            headers: {
                                Authorization: "Bearer " + api_key,
                                'Content-Type': 'application/json',
                            },
                            data: JSON.stringify(data),
                        }).then(function (response) {
                            $('#loading').hide();
                            $('#filterForm input[type="submit"]').show();
                            let result = document.getElementById('result')

                            result.innerHTML = '';

                            let pre = document.createElement('pre')
                            pre.innerHTML = "\n\n" + response.choices[0].message.content
                            result.appendChild(pre)

                            document.getElementById('keywords').value = ""
                            const preText = document.querySelector('#result pre').innerText;
                            document.getElementById('keywords').value = preText;
                        });

                    }

                </script>
            </div>


            <div class="hooms-N17" data-bid="UwLqa9WdPl">
                <div class="contents-inner" align="center">


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