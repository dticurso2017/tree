/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function () {
    $('#login-form-link').click(function (e) {
        $("#login-form").delay(100).fadeIn(100);
        $("#register-form").fadeOut(100);
        $('#register-form-link').removeClass('active register-active');
        $(this).addClass('active login-active');
        e.preventDefault();
    });
    $('#register-form-link').click(function (e) {
        $("#register-form").delay(100).fadeIn(100);
        $("#login-form").fadeOut(100);
        $('#login-form-link').removeClass('active login-active');
        $(this).addClass('active register-active');
        e.preventDefault();
    });
    
    $("#register-submit").click(function () {
        var password = $("#password_register").val();
        var elemento_confirm_Password = document.getElementById("confirm_password_register");
        var confirm_Password = elemento_confirm_Password.value;
        
        if(password === confirm_Password){
            elemento_confirm_Password.setCustomValidity("");
        } else {
            elemento_confirm_Password.setCustomValidity("Las contraseñas no coinciden");
        }
    });
});