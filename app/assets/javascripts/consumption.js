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
  // var userId = 
 e.preventDefault(); 
 var drinkId = $('#consumption_drink').val()
  $.ajax({
   type: 'POST',
   url: '/users/12/consumptions',
   // url: '/users/'+ userId + '/consumptions'
   data: {  
   format: 'json',  
   consumption:{ drink: drinkId } 
   }
 }).done(function(data){
       console.log(data.drink_name, data.drinks_count, data.drinks_calories, data.drunk_level, data.drive)
    $('#hallo').append(data.drink_name);
    $('#drink-count').html(data.drinks_count);
    $('#calulate-calories').html(data.drinks_calories);
    $('#calulate-bac').html(data.drinks_bac);
    $('#drunk-level').html(data.drunk_level);
    $('#drive').html(data.drive);   
 })
}



// function deleteConsumption(e){
//   var deleteBottom = $(this)
//   var itemId = $(this).data('id');
//   $.ajax({
//   type: "DELETE",
//   url: "/items/" + itemId,
//   dataType: 'json'
// }).done(function(data){
//   console.log(data);
//   deleteBottom.parent().remove()

// })
// }


$(document).ready(function(){

$("#add_drink").on('click', addConsumption);
$("#drink_form").on('submit', '#new_consumption', createConsumption)
 $('#todo-list').on('click', '.destroy', deleteItems)

$( ".userinfo" ).click(function() {
  $( "#usertoggle").slideToggle( "slow" );
});

$( ".drinkinfo" ).click(function() {
  $( "#drinktoggle" ).slideToggle( "slow" );

});

$( ".adddrink" ).click(function() {
  $( "#adddrinktoggle" ).slideToggle( "slow" );

});



})

