document.addEventListener('turbolinks:load', function(){
  $('.new_badge_radio').change(radioButtonHandler);
  if ($('new_badge_radio')){
    $('select').prop("disabled", true);
  }

  function radioButtonHandler(){
    $('.new_badge_radio').each(function() {
      $subform = $('#' + get_subform_id(this));
      if ($(this).is(':checked')) {
        $subform.prop("disabled", false);
      } 
      else {
        $subform.prop("disabled", true);
      }
    })
  }

  function get_subform_id(elem){
    return elem.id.replace('_rule','');
  }
})
