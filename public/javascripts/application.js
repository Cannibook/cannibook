$(document).ready(function() {
  $('.flash').fadeOut(4000)
  
  $('#density').slider({
    min: 1,
    max: 5,
    stop: function() {
      var density_value = $(this).slider('option', 'value')
      $('#strain_density').attr('value', density_value)
      $('.density').html(density_value)
    }
  })
  
  $('#trim').slider({
    min: 1,
    max: 5,
    stop: function() {
      var trim_value = $(this).slider('option', 'value')
      $('#strain_trim').attr('value', trim_value)
      $('.trim').html(trim_value)
    }
  })
  
  $('.autocomplete').autocomplete({
    source: '/list_dispensaries'
  })
  
  if($('#strain_density').attr('value') > 0) {
    var dens = $('#strain_density').attr('value')
    $('#density').slider('option', 'value', dens)
    $('.density').html(dens)
  }
  
  if($('#strain_trim').attr('value') > 0) {
    var trim = $('#strain_trim').attr('value')
    $('#trim').slider('option', 'value', trim)
    $('.trim').html(trim)
  }
})