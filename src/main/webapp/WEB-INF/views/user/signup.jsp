<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<title>회원가입</title>
<style>
.rightAside {
	float: right;
	width: 350px;
}
.leftAside {
	float: left;
	width: 350px;
}
div.signup{
  width: 600px;
  height: 600px;
  border: 1px solid #000;
  border-radius: 10px;
  text-align: left;
  padding: 40px 40px;
  font-family:'d2coding';
  float:left;
}
</style>
<script>

$(function(){
$('form').on('submit',function(e){
  let g1 = $('[name=genre1]').val();
  let g2 = $('[name=genre2]').val();
  let g3 = $('[name=genre3]').val();
  if($('[name=u_id]').val()==''){
    alert('아이디를 입력하세요.');
    return false;
  }
  if($('[name=idCheckResult]').html()== "중복된 아이디입니다."){
    alert('중복된 아이디 입니다. 다시 확인 해주세요.');
    return false;
  }
  if($('[name=idCheckResult]').html()== ""){
    alert('아이디 중복확인을 해주세요.');
    return false;
  }
  if($('[name=pw]').val()==''){
    alert('비밀번호를 입력하세요.');
    return false;
  }
  if($('#pwCheckResult').html()== ""){
    alert('비밀번호확인을 입력하지 않았습니다.');
    return false;
  }
  if($('#pwCheckResult').html()== "비밀번호가 일치하지 않습니다."){
    alert('비밀번호가 일치하지 않습니다.');
    return false;
  }
  if($('[name=n_name]').val()==''){
    alert('닉네임을 입력하세요.');
    return false;
  }
  if($('[name=nnCheckResult]').html()== ""){
    alert('닉네임 중복확인을 해주세요.');
    return false;
  }
  if($('[name=nnCheckResult]').html()== "중복된 닉네임입니다."){
    alert('중복된 닉네임입니다. 다시 확인 해주세요.');
    return false;
  }
  if(g1==''){
    alert('첫번째 장르를 선택해주세요.');
    return false;
  }
  if(g2==''){
    alert('두번째 장르를 선택해주세요.');
    return false;
  }
  if(g3==''){
    alert('세번째 장르를 선택해주세요.');
    return false;
  }
  if(g1==g2 || g1==g3 || g2==g3){
    alert('장르가 중복입니다. 다시 확인 해주세요.');
    return false;
  }
  if($('[name=p_q]').val()==''){
    alert('질문을 선택해주세요.');
    return false;
  }
  if($('[name=p_a]').val()==''){
    alert('답변을 입력해주세요.');
    return false;
  }
});

  $('form').on('submit',function(e){
    if($('[name=u_id]').val()==''){
      alert('아이디를 입력하세요.');
      return false;
    }
  });

  $('#idCheck').on('click', function(e){
    let u_id = $('[name=u_id]').val();
    $.ajax({
      type : 'POST',
      url : "useridCheck",
      dataType : "text",
      data : {
        "u_id" : u_id
      },
      success : function(useridCheck){
        $("#idCheckResult").html(useridCheck);
      }
    })
    e.preventDefault();
    e.stopPropagation();
  });

  $('#nnCheck').on('click', function(e){
    let n_name = $('[name=n_name]').val();
    $.ajax({
      type : 'POST',
      url : "nnCheck",
      dataType : "text",
      data : {
        "n_name" : n_name
      },
      success : function(nnCheck){
        $("#nnCheckResult").html(nnCheck);
      }
    })
    e.preventDefault();
    e.stopPropagation();
  });

  $('[name=pwck]').keyup(function(){
    let passwd = $('[name=pw]').val();
    let passwdCheck = $('[name=pwck]').val();
    if (passwd == passwdCheck){
      $('#pwCheckResult').html("비밀번호가 일치합니다.")
    } else{
      $('#pwCheckResult').html("비밀번호가 일치하지 않습니다.")
    }
  })
});

</script>
</head>
<body>
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
  <div class="signup">
    <form action="/signup" method="POST" encType = "multipart/form-data">
      <p>아이디 : <input type="text" name="u_id"/>
        <button id="idCheck">중복확인</button>
        <span id="idCheckResult" name="idCheckResult"></span>
      </p>
      <p>닉네임 : <input type="text" name="n_name"/>
        <button id="nnCheck">중복확인</button>
        <span id="nnCheckResult" name="nnCheckResult"></span>
      </p>
      <p>비밀번호 : <input/ type="password" name="pw"></p>
      <p>비밀번호 확인 : <input type="password" name="pwck"/><span id="pwCheckResult" name="pwCheckResult"></span></p>
      <p>선호 장르는 3가지를 선택해 주셔야 하며 중복되지 않도록 선택 바랍니다.</p>
      <p>선호 장르1 :
        <select name="genre1">
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
        <select name="genre2">
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
        <select name="genre3">
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
      <p>비밀번호 찾기에 사용 할 질문 및 답변</p>
      <p>질문 :
        <select name="p_q">
          <option value="">질문내용</option>
          <option value="pq1">입학한 초등학교 이름은?</option>
          <option value="pq2">입학한 중학교 이름은?</option>
          <option value="pq3">입학한 고등학교 이름은?</option>
          <option value="pq4">지금 거주하고 있는 지역 이름은?</option>
        </select>
      </p>
      <p>답변 : <input type="text" name="p_a"/></p>
      <p><button>가입하기</button></p>
    </form>
  <div>
</div>
</body>
</html>