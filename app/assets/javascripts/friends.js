var init_friend_lookup

init_friend_lookup = function() {
  
  $('#friend-lookup-form').on('ajax:before', function(){
      show_spinner();
      $('#friend-lookup-results').replaceWith(' ');
  });
  
  $('#friend-lookup-form').on('ajax:after', function(){
      hide_spinner();
  });
 
  $('#friend-lookup-form').on('ajax:success', function(event, data, status){
      $('#friend-lookup').replaceWith(data);
      init_friend_lookup();
  });
  
  $('#friend-lookup-form').on('ajax:error', function(event, xhr, status, error){
     hide_spinner();
     $('#friend-lookup-results').text(' ');
     $('#friend-lookup-errors').replaceWith('User was not found');
  });
  
}

$(document).ready(function() {
    init_friend_lookup();
})