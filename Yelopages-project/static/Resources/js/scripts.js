
$(".form-check-input").click(function() {
  if(document.getElementById("provide_service").checked == true){
      document.getElementById("profession_dropdown").style.display = "";
  }else{
      document.getElementById("profession_dropdown").style.display = "none";
  }
  
});

$(".dropdown-menu a").click(function(){
  var selText = $(this).text();
  console.log("HI");
  $(this).parents('.btn-group').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');
});