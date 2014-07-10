landing =
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

    $.ajax(
      type: 'POST'
      dataType: 'jsonp'
      url: url
      data: data
    ).done( (r) ->
      console.log r
    ).error( (e) ->
      console.log e
    )
    landing.subject = 'Contact form'

$(document).ready ->
  contacts = $('#contacts')

  $('.btn-order').click ->
    landing.subject = 'Order form'
    contacts.find('#InputMessage').val(this.value)
    contacts.modal 'show'

  $('#sendContactForm').click ->
    from = contacts.find('#InputEmail').val()
    html = contacts.find('#InputMessage').val()
    from = 'maxim.krivodaev@gmail.com'
    landing.send_email from, html