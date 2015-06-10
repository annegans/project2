console.log('hello')

// Shows the new form journey via AJAX request
function addConsumption(e) {
var baseURL = e.currentTarget.baseURI
 e.preventDefault();
 $.ajax({
   type: 'GET',
   url: baseURL + '/new'
 }).done(function(response){
   var form = $($.parseHTML(response)).filter('#drinkForm')
   $('#drink_form').append(form)
 })
}

// Posts AJAX form to create a new consumption
function createConsumption(e) {
  console.log("createConsumption")
 e.preventDefault(); 
 var drinkId = $('#consumption_drink').val()
  $.ajax({
   type: 'POST',
   url: '/users/10/consumptions',
   data: {  
    format: 'json',  
    consumption:{ drink: drinkId } 
   }
 }).done(function(data){
    $('#hello').empty();
    var newDrinks = $($.parseHTML(data)).filter('#hello');
    console.log(data)
     $('#hello').append(newDrinks);
  
    
 })
}


$(document).ready(function(){

$("#add_drink").on('click', addConsumption);
$("#drink_form").on('submit', '#new_consumption', createConsumption)

$( ".userinfo" ).click(function() {
  $( "#usertoggle" ).slideToggle( "slow" );
});

$( ".drinkinfo" ).click(function() {
  $( "#drinktoggle" ).slideToggle( "slow" );

});

$( ".adddrink" ).click(function() {
  $( "#adddrinktoggle" ).slideToggle( "slow" );

});



})

