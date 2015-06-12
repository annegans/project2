console.log('hello')

// Shows the new form journey via AJAX request
function addConsumption(e) {
var baseURL = e.currentTarget.baseURI
 e.preventDefault();
 $.ajax({
   type: 'GET',
   url: baseURL + '/new'
 }).done(function(response){
   // $('#drink_form').emty()
   var form = $($.parseHTML(response)).filter('#drinkForm')
   // $('.add-drink').append(form)
   $('#drink_form').html(form)
 })
}

// Posts AJAX form to create a new consumption
function createConsumption(e) {
  // var userId = 
 e.preventDefault(); 
 var drinkId = $('#consumption_drink').val()
  $.ajax({
   type: 'POST',
   url: '/users/17/consumptions',
   // url: '/users/'+ userId + '/consumptions'
   data: {  
   format: 'json',  
   consumption:{ drink: drinkId } 
   }
 }).done(function(data){
       console.log(data.drink_name, data.drinks_count, data.drinks_calories, data.drunk_level, data.drive, data.drink_shot )
    $('#hallo').append(data.drink_name);
    $('#drink-count').html(data.drinks_count);
    $('#calulate-calories').html(data.drinks_calories);
    $('#calulate-bac').html(data.drinks_bac);
    $('#drunk-level').html(data.drunk_level);
    $('#drive').html(data.drive); 
    //drunk level     
    $('#beer').html(data.drink_beer);      
    $('#wine').html(data.drink_wine);      
    $('#spirit').html(data.drink_spirit);      
    $('#shot').html(data.drink_shot);  
    // $('#drinktoggle').append('<ul id="deleteddrinklist"><li>' + data.drink_name + '</li><button id = "destroy" data-id="' + variable +'>Delete</button></ul>');
 })
}

function populatePage(){
  $.ajax({
    type: 'get',
    url: '/users/17/consumptions',
    data: {  
      format: 'json',
      // consumption:{ drink: drinkId } 
    }
  }).done(function(data){
    $('#drink-count').html(data.drinks_count);
    $('#calulate-calories').html(data.totalcalories);
    $('#calulate-bac').html(data.bac);
    // drunklevel
    $('#beer').html(data.drink_beer);      
    $('#wine').html(data.drink_wine);      
    $('#spirit').html(data.drink_spirit);      
    $('#shot').html(data.drink_shot); 
  })
}



function deleteConsumption(e){

  var deleteBottom = $(this)
  var consumptionId = $(this).data('id');
  console.log('works')
  $.ajax({
  type: "DELETE",
  url: "/users/17/consumptions/" + consumptionId,
  dataType: 'json'
}).done(function(data){
  console.log(data);
  deleteBottom.parent().remove()

})
}


$(document).ready(function(){

populatePage();

setInterval(function(){ 
  populatePage(); 
}, 1000);
  // eventlisteners
$("#add_drink").on('click', addConsumption);

$("#drink_form").on('submit', '#new_consumption', createConsumption)
 $('.container').on('click', '#destroy', deleteConsumption)
///toggleclases
$( ".userinfo" ).click(function() {
  $( "#usertoggle").slideToggle( "slow" );
});

$( ".drinkinfo" ).click(function() {
  $( "#drinktoggle" ).slideToggle( "slow" );

});

$( ".adddrink" ).click(function() {
  $( "#adddrinktoggle" ).slideToggle( "slow" );

});

//style change  white
$('#hallo').click(function() {
   $('.head').css({
        'background-color': 'black',
        'color': 'white'

    }); 
    $('.container').css({
        'background-color': 'black',

    });

    $('.box').css({
        'background-color': 'white',
    });

    $('.box-title').css({
        'background-color': 'white',
        'color': 'black' 
    });

    $('.sub-heading').css({
       'color': 'black' 
    });

    $('.description').css({
       'background-color': 'white',
       'color': 'black' 
    });

    $("button, input[type='submit']").css({
        'background-color': 'transparent',
        'border': '2px solid black',
        'color': 'black',
        'padding': '6px 18px',
        'font-size': '18px !important',
        'margin': '21px !important' 
    });

    $('.box-4').css({
        'color': 'black' 
      });

     $('.description-special').css({
         'color': 'black' 
        });

       $('.description-right').css({
         'color': 'black' 
        });
});


$('.one').click(function(){
       $('.box').css({
      'border': '1px solid white'

      });

   $('.one').css({
      'background-image': 'url("/assets/een.gif")',
      'background-size': 'cover'
      });

    $('.two').css({
      'background-image': 'url("/assets/two.gif")',
      'background-size': 'cover'
      });

    $('.three').css({
      'background-image': 'url("/assets/eleven.gif")',
      'background-size': 'cover'
      });

    $('.four').css({
      'background-image': 'url("/assets/four.gif")',
      'background-size': 'cover'
      });
    $('.five').css({
      'background-image': 'url("/assets/five.gif")',
      'background-size': 'cover'
      });
    $('.six').css({
      'background-image': 'url("/assets/twelve.gif")',
      'background-size': 'cover'
      });
    $('.seven').css({
      'background-image': 'url("/assets/seven.gif")',
      'background-size': 'cover'
      });
    $('.eight').css({
      'background-image': 'url("/assets/eight.gif")',
      'background-size': 'cover'
      });
    $('.nine').css({
      'background-image': 'url("/assets/nine.gif")',
      'background-size': 'cover'
      });
    $('.ten').css({
      'background-image': 'url("/assets/ten.gif")',
      'background-size': 'cover'
      });


})


})

