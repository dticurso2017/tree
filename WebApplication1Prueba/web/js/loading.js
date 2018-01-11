$(function () {
 $('#login-submit').click(function () {
  var username = $("#username").val();
  var password = $("#password").val();
  if (username !== "" && password !== "") {
   setTimeout(function () {
    document.getElementById('login-submit').style.visibility = 'hidden';
    document.getElementById('cargando').style.visibility = 'visible';
   }, 200);
  }
 });
});

$(function () {
 $('#register-submit').click(function () {
  var username = $("#user_register").val();
  var email = $("#email_register").val();
  var password = $("#password_register").val();
  var password_confirm = $("#confirm_password_register").val();
  if (username !== "" && email !== "" && password !== "" && password_confirm !== "") {
   setTimeout(function () {
    document.getElementById('register-submit').style.visibility = 'hidden';
    document.getElementById('cargando2').style.visibility = 'visible';
   }, 200);
  }
 });
});