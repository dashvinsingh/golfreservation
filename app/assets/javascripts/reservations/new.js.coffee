
$ ->
  $(document).on 'change', '#golfclubs_select', (evt) ->
    $.ajax 'update_timeslots',
      type: 'GET'
      dataType: 'script'
      contentType: 'text/javascript'
      data: {
        golfclub_id: $("#golfclubs_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")