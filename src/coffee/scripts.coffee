landing =
  dismiss_btn: '<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span></button>'
  recipient:
    email: 'maxim.krivodaev@gmail.com'
    type: 'to'
  email_api:
    url: 'https://mandrillapp.com/api/1.0/'
    commands:
      'send': 'messages/send.json'
  subject: 'Contact form'
  send_email: (from, html) ->
    url = landing.email_api.url + landing.email_api.commands.send
    data =
      key: 'tvu6wJsFFNgYHCh9ce0SJw'
      message:
        from_email: from
        to: [landing.recipient]
        autotext: true
        subject: landing.subject
        html: html

    $.ajax
      type: 'POST'
      url: url
      data: data
      dataType: 'JSONP'
      success: -> $('#messages').html('<div class="alert alert-success">Message send</div>')
      error: -> $('#messages').html('<div class="alert alert-danger">Message NOT send</div>')

    landing.subject = 'Contact form'

$(document).ready ->
  contacts = $('#contacts')

  $('.btn-order').click ->
    landing.subject = 'Order form'
    contacts.find('#InputMessage').val(this.value)
    contacts.modal 'show'

  $('#sendContactForm').click (e) ->
    e.preventDefault()
    from = contacts.find('#InputEmail').val()
    html = contacts.find('#InputMessage').val()
    from = 'maxim.krivodaev@gmail.com'
    landing.send_email from, html
    contacts.modal 'hide'