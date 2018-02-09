jQuery ->
  $('.edit_task label input[type=checkbox]').click ->
    $.ajax
      url: $(this).parent('label').parent('form')[0].action
      headers:
        Accept: 'text/javascript; charset=utf-8'
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
      type: 'PATCH'
      data:
        'task[complete]': $(this).is(':checked')
        'authenticity_token': $(this).siblings('#authenticity_token').val()
