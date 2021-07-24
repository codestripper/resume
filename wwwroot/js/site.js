// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
$(document).ready(function () {

    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })

    function WidthCheck(x) {
        if (x.matches && !document.getElementById('sidebar').classList.contains('active')) { // If media query matches
          $('#sidebar').toggleClass('active');
        }
      }
      
      var x = window.matchMedia("(max-width: 768px)")
      WidthCheck(x)
      x.addEventListener('change', WidthCheck)

});