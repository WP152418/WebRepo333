<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>유정이블로그</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
   integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
   crossorigin="anonymous">

<script>
   function meny_over(e) {
      e.setAttribute("class", "nav-item active"); //<li class="nav-item active>"
   }
   function meny_out(e) {
      e.setAttribute("class", "nav-item"); //<li class="nav-item">
   }
</script>
<style>
div.container {
   padding-top: 30px;
}
</style>

<link href="../css/blog.css" rel="stylesheet">
<link href="../css/album.css" rel="stylesheet">

</head>
<body>

   <!-- 메뉴바  -->
   <nav class="navbar navbar-expand-lg navbar-light"
      style="background-color: pink;">
      <a class="navbar-brand" href="#">MyBlog</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse"
         data-target="#navbarSupportedContent"
         aria-controls="navbarSupportedContent" aria-expanded="false"
         aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
         <ul class="navbar-nav mr-auto">
            <li class="nav-item active"><a class="nav-link"
               href="blog.html">Home<span class="sr-only">(current)</span></a></li>
            <li class="nav-item" onmouseover="menu_over(this);"
               onmouseout="menu_out(this);"><a class="nav-link"
               href="favoriteFood.html">Favorite Food<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item" onmouseover="menu_over(this);"
               onmouseout="menu_out(this);"><a class="nav-link"
               href="favoriteSinger.html">Favorite Singer <span
                  class="sr-only">(current)</span></a></li>
            <li class="nav-item" onmouseover="menu_over(this);"
               onmouseout="menu_out(this);"><a class="nav-link"
               href="favoriteTravelDestination.html">Favorite Travel
                  Destination <span class="sr-only">(current)</span>
            </a></li>
         </ul>
         <ul class="navbar-nav my-2 my-lg-0" id="navbarRight">
            <%
               if ("true".equals(request.getSession().getAttribute("logged_in"))) {
            %>
            <li class="nav-item"><a class="nav-link"
               href="/WebClass/bloglogout"> <%=request.getSession().getAttribute("name") %>님
            </a></li>
            <%
               } else {
            %>
            <form class="form-inline my-2 my-lg-0" id="loginForm">
            <input class="form-control mr-sm-2" type="text" size="15"
               placeholder="ID" aria-label="ID" id="id" required> <input
               class="form-control mr-sm-2" type="password" size="15"
               placeholder="PWD" aria-label="PWD" id="pwd" required>
            <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">Login</button>
         </form>

         <form class="form-inline my-2 my-lg-0" id="joinForm">
            <a href="join.html"><button
                  class="btn btn-outline-secondary my-2 my-sm-0" type="button">Join</button></a>
         </form>
            <% } %>
         </ul>

      </div>
   </nav>
   
//컨테이너//

   <!-- 모달창 -->
   <div class="modal" id="myModal">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">로그인 결과</h5>
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <p></p>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary"
                  data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>

   <!-- Optional JavaScript -->
   <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
      integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
      crossorigin="anonymous"></script>
   <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
      integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
      crossorigin="anonymous"></script>


   <script>
      $(document).ready(function() {
         $("#loginForm").submit(function(event) {
            // submit되는 것을 막기
            event.preventDefault();

            console.log('start');
            // id, pwd 값 가져오기
            var id = $("#id").val();
            var pwd = $("pwd").val();
            console.log(id, pwd);

            $.post({
               url : '/WebClass/bloglogin',
               dataType : 'json',
               data : {
                  id : id,
                  pwd : pwd
               },
               success : function(data) {
                  var myModal = $('#myModal');
                  myModal.modal();
                  myModal.find('.modal-body').html(data.msg);
                  if (data.status == "success") {
                     $('#loginForm').html("");
                     $('#joinForm').html("");
                     $('#navbarRight').html('<li class="nav-item"><a class="nav-link" href="/WebClass/bloglogout">'+data.name+'님</a></li>')
                  } else {
                     $('#pwd').val("");
                  }
               }
            });
         });
      });
      // 간단하게 쓰기
      $(function() {

      });
   </script>


</body>
</html>