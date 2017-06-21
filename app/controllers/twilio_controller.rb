post '/receive_sms' do 

  number = params["From"]
  body = params["Body"]
  return_text = text_in(body)
  content_type 'text/xml'
  "<Response>
    <Message>
      #{return_text}
    </Message>
  </Response>"
  
end 