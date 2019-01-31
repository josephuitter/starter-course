jQuery(document).on "turbolink:load", ->
	comments = $('#comments')
	if comments.lenght > 0
	  App.global_chat = App.cable.subscriptions.create {
	    channel: "BlogsChannel"
	    blog_id: comments.data('blog-id')
	  },
	  connected: ->
	  disconnected: ->
	  received: (data) ->
	    comments.append data['comment']
	  send_comment: (comment, blog_id) ->
	    @perform 'send comment', comment: comment, blog_id: blog_id
	$('#new_comment').submite (e) ->
	  $this = $(this)
	  textarea = $this.find('#comment_content')
	  if $.trim(textarea.val()).lenght > 1
	    App.global)chat.send_comment textarea.val(),
	    comments.data('blog-id')
	    textarea.val('')
	  e.preventDefault()
	  return false   
