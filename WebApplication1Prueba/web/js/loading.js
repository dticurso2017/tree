$(function () {
 $('#login-submit').click(function () {
  var username = $("#username").val();
  var password = $("#password").val();
  if (username !== "" && password !== "") {
   setTimeout(function () {
    document.getElementById('login-submit').style.visibility = 'hidden';
    document.getElementById('cargando').style.visibility = 'visible';
   }, 100);
  }
 });
});