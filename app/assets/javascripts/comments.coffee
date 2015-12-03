$(document).on "page:change", ->
  $('#comment-link').click (event) ->
    event.preventDefault()
    $('#create-comment').fadeToggle()
    $('#create-comment_body').focus()
  $('#create-article').click (event) ->
  	event.preventDefault()
  $('#article-submit-button').click (event) ->
  	event.preventDefault()