<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="referrer" content="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<title>Insert title here</title>
<style>

.headerB{ font-size: 80px!important }

.rightAside {
	float: right;
	width: 350px;
}
.leftAside {
	float: left;
	width: 350px;
}
ul{
    list-style:none;
}

.eGName{
    color:#c0c0c0;
}

.mypage{
  height: 800px;
  border: 1px solid #000;
  border-radius: 10px;
  text-align: center;
  margin: 50px 450px 0px 350px;
  background-color: #fff;

}
.mypagein{
  width: 500px;
  height: 600px;
  border: 1px solid #000;
  border-radius: 10px;
  text-align: left;
  padding: 40px 40px;
  font-family:'d2coding';
  float:left;
}
.profile{
  width: 100px;
  height: 100px;
  float:left;
}
</style>
<script>
function nnCheckEnter(){
  if(window.event.keyCode == 13){
    let cn_name = $('input[name=n_name]').val();
    let n_name = "${user.n_name}";
    if(cn_name != n_name){
      $.ajax({
        type : 'POST',
        url : "nnCheck",
        dataType : "text",
        data : {
          "n_name" : cn_name
        },
        success : function(nnCheck){
          $("#nnCheckResult").text(nnCheck);
        }
      })
    } else{
     $("#nnCheckResult").text("현재 닉네임과 동일한 닉네임입니다.");
    }
  }
};
function enumsendEnter(){
  if(window.event.keyCode == 13){
    $("#enumsendResult").text("");
    let regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    let email = $('input[name=email]').val();

    if(email == ""){
      $("#enumsendResult").text("이메일을 입력해 주세요.");
      return false;
    }

    if(email == '' || email == 'undefined') return false;
    if(email.match(regExp) != null){
      $.ajax({
        type : 'POST',
        url : "email",
        dataType : "text",
        data : {
          "email" : email
        },
        success : function(enumsend){
          $("#enumsendResult").text(enumsend);
        }
      });
      return false;
    }else {
      $("#enumsendResult").text("올바른 이메일 형식이 아닙니다.");
      return false;
    }
  }
};
$(function(){
  $('form').on('submit',function(e){
    let n_name = "${user.n_name}";
    let cn_name = $('input[name=n_name]').val();
    let email = "${user.email}";
    let cemail = $('input[name=email]').val();
    let g1 = $('[name=genre1]').val();
    let g2 = $('[name=genre2]').val();
    let g3 = $('[name=genre3]').val();
    if(cn_name != n_name){
      if($('[name=nnCheckResult]').text() == "중복된 닉네임입니다."){
        alert('아이디 중복체크를 확인해 주세요.');
        return false;
      }
      if($('[name=nnCheckResult]').text() == ""){
        alert('아이디 중복체크를 해주세요.');
        return false;
      }
    }
    if(cemail != email){
      if($('[name=enumsendResult]').text() == "중복된 이메일입니다."){
        alert('이메일을 확인해 주세요.');
        return false;
      }
      if($('[name=enumsendResult]').text() == "중복된 이메일입니다."){
        alert('이메일을 확인해 주세요.');
        return false;
      }
      if($('[name=enumsendResult]').text() == "올바른 이메일 형식이 아닙니다."){
        alert('이메일을 확인해 주세요.');
        return false;
      }
      if($('[name=enumsendResult]').text() == "이메일을 확인해 주세요."){
        alert('이메일을 확인해 주세요.');
        return false;
      }
      if($('[name=enumckResult]').text() == "인증번호가 발송 됐습니다."){
        if($('[name=enumckResult]').text() == ""){
          alert('인증번호를 입력해 주세요.');
          return false;
        }
        if($('[name=enumckResult]').text() == "인증번호가 일치하지 않습니다."){
          alert('인증번호가 일치하지 않습니다.');
          return false;
        }
      }
    }
    if(g1==''){
      alert('첫번째 장르를 선택해 주세요.');
      return false;
    }
    if(g2==''){
      alert('두번째 장르를 선택해 주세요.');
      return false;
    }
    if(g3==''){
      alert('세번째 장르를 선택해 주세요.');
      return false;
    }
    if(g1==g2 || g1==g3 || g2==g3){
      alert('장르가 중복입니다. 다시 확인해 주세요.');
      return false;
    }
  });

  function back(){
    location.href = "/user/mypage";
  }

  $('#nnCheck').on('click', function(e){
    let cn_name = $('input[name=n_name]').val();
    let n_name = "${user.n_name}";
    if(cn_name != n_name){
      $.ajax({
        type : 'POST',
        url : "nnCheck",
        dataType : "text",
        data : {
          "n_name" : cn_name
        },
        success : function(nnCheck){
          $("#nnCheckResult").text(nnCheck);
        }
      })
    } else{
     $("#nnCheckResult").text("현재 닉네임과 동일한 닉네임입니다.");
    }
    e.preventDefault();
    e.stopPropagation();
  });

  $('#enumsend').on('click', function(e){
    $("#enumsendResult").text("");
    let regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    let cemail = $('input[name=email]').val();
    let email = "${user.email}";
    if(cemail == ""){
      $("#enumsendResult").text("이메일을 입력해 주세요.");
      return false;
    }
    if(cemail == email){
      $("#enumsendResult").text("현재 이메일과 동일한 이메일입니다.");
      return false;
    }

    if(cemail == '' || cemail == 'undefined') return false;
    if(cemail.match(regExp) != null){
      $.ajax({
        type : 'POST',
        url : "email",
        dataType : "text",
        data : {
          "email" : cemail
        },
        success : function(enumsend){
          $("#enumsendResult").text(enumsend);
        }
      });
      return false;
    }else {
      $("#enumsendResult").text("올바른 이메일 형식이 아닙니다.");
      return false;
    }
  });

  $('#emailcode').keyup(function(){
    $("#enumckResult").text("");
    let ecodeck = $('input[name=emailcode]').val();
    $.ajax({
      type : 'POST',
      url : "ecodeck",
      dataType : "text",
      data : {
        "ecodeck" : ecodeck
      },
      success : function(en){
        $("#enumckResult").text(en);
      }
    });
  });

});

</script>
</head>
<body class="w3-light-grey">
<%@ include file="/WEB-INF/include/menus.jsp" %>
<header class="w3-container w3-center w3-padding-48 w3-white">
    <h1 class="headerB"><b>Game List</b></h1>
</header>
<div style="width: 100%; height: 500px;  ">
  <div>
    <aside class="leftAside">
      <h1>왼쪽사이드</h1>
    </aside>
  </div>
  <div>
    <aside class="rightAside">
      <%@ include file="/WEB-INF/include/loginbox.jsp" %>
      <br><br>
      <%@ include file="/WEB-INF/include/topgame.jsp" %>
    </aside>
  </div>
  <div class="mypage">
    <form action="/user/profilupdate" method="POST" encType = "multipart/form-data" onsubmit="return false">
      <div class="profile">
        <p>
          <c:set var="img" value="${user.img}"/>
          <c:choose>
            <c:when test="${img eq null}">
              <p><img src="/img/userProfile/default/default.png" class="w3-circle" alt="UserProfile" style="width : 100%"/></p>
            </c:when>
            <c:otherwise>
              <p><img src="/img/userProfile/${user.u_id}/${user.img}" class="w3-circle" alt="UserProfile" style="width : 100%"/></p>
            </c:otherwise>
          </c:choose>
        </p>
        <button name="update">수정완료</button>
        <a class="undo" href="/mypage" style="font-size:15px;">취소하기</a>
      </div>
      <div class="mypagein">
        <input type="hidden" name="pw" value="${user.pw}">
        <p>&nbsp;&nbsp;&nbsp;&nbsp;아이디 : <input type="text" name="u_id" value="${user.u_id}" readonly/></p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;닉네임 : <input type="text" name="n_name" value="${user.n_name}" onkeyup="nnCheckEnter()"/>
          <button type="button" id="nnCheck" name="nnCheck">중복확인</button>
          <span id="nnCheckResult" name="nnCheckResult"></span>
        </p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;이메일 :
          <input type="text" name="email" value="${user.email}" onkeyup="enumsendEnter()">
          <button type="button" id="enumsend" name="enumsend">인증번호전송</button>
          <span id="enumsendResult" name="enumsendResult"></span>
        </p>
        <p>&nbsp;&nbsp;인증번호 : <input type="text" placeholder="인증번호 6자리를 입력해 주세요." name="emailcode" id="emailcode">
          <span id="enumckResult" name="enumckResult"></span>
        </p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;선호 장르는 중복되지 않도록 선택해 주세요.</p>
        <p>선호 장르1 :
          <select name="genre1" id="genre1">
            <option value="">선호 장르1</option>
            <option value="RPG">RPG</option>
            <option value="어드벤쳐">어드벤쳐</option>
            <option value="FPS">FPS</option>
            <option value="스포츠">스포츠</option>
            <option value="TCG">TCG</option>
            <option value="보드">보드</option>
            <option value="레이싱">레이싱</option>
            <option value="슈팅">슈팅</option>
            <option value="액션">액션</option>
            <option value="시뮬레이션">시뮬레이션</option>
            <option value="RTS">RTS</option>
            <option value="퍼즐">퍼즐</option>
            <option value="리듬액션">리듬액션</option>
            <option value="SNG">SNG</option>
            <option value="AOS">AOS</option>
            <option value="기타">기타</option>
          </select>
        </p>
        <p>선호 장르2 :
          <select name="genre2" id="genre2">
            <option value="">선호 장르2</option>
            <option value="RPG">RPG</option>
            <option value="어드벤쳐">어드벤쳐</option>
            <option value="FPS">FPS</option>
            <option value="스포츠">스포츠</option>
            <option value="TCG">TCG</option>
            <option value="보드">보드</option>
            <option value="레이싱">레이싱</option>
            <option value="슈팅">슈팅</option>
            <option value="액션">액션</option>
            <option value="시뮬레이션">시뮬레이션</option>
            <option value="RTS">RTS</option>
            <option value="퍼즐">퍼즐</option>
            <option value="리듬액션">리듬액션</option>
            <option value="SNG">SNG</option>
            <option value="AOS">AOS</option>
            <option value="기타">기타</option>
          </select>
        </p>
        <p>선호 장르3 :
          <select name="genre3" id="genre3">
            <option value="">선호 장르3</option>
            <option value="RPG">RPG</option>
            <option value="어드벤쳐">어드벤쳐</option>
            <option value="FPS">FPS</option>
            <option value="스포츠">스포츠</option>
            <option value="TCG">TCG</option>
            <option value="보드">보드</option>
            <option value="레이싱">레이싱</option>
            <option value="슈팅">슈팅</option>
            <option value="액션">액션</option>
            <option value="시뮬레이션">시뮬레이션</option>
            <option value="RTS">RTS</option>
            <option value="퍼즐">퍼즐</option>
            <option value="리듬액션">리듬액션</option>
            <option value="SNG">SNG</option>
            <option value="AOS">AOS</option>
            <option value="기타">기타</option>
          </select>
        </p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;가입일 : ${user.indate}</p>
      </div>
    </form>
  </div>
</div>
<script>
$('select[name=genre1]').val('${user.genre1}').prop("selected",true);
$('select[name=genre2]').val('${user.genre2}').prop("selected",true);
$('select[name=genre3]').val('${user.genre3}').prop("selected",true);
</script>
</body>
</html>
