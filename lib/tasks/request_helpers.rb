def puts_request(request)
  puts '--- Request'
  puts "method: #{request.method}"
  puts "url: #{request.redacted_url.inspect}"
  puts "headers: #{request.processed_headers.to_a.sort.map { |(k, v)| [k.inspect, v.inspect].join("=>") }.join(", ")}"
  puts "payload: #{request.payload.short_inspect if request.payload}"
  puts ''
end

def puts_response(response)
  puts '--- Response'
  puts "code: #{response.code}"
  puts "headers: #{response.headers}"
  puts "body: #{response.body}"
  puts ''
end

def puts_response_error(exception)
  body = JSON.load(exception.http_body)
  puts '--- Response Error'
  puts "code: #{exception.http_code}"
  puts "headers: #{exception.http_headers}"
  puts "status: #{body['status']}"
  puts "error: #{body['error']}"
  puts "exception: #{body['exception']}"
  puts "trace:"
  body['traces']['Full Trace'].each { |trace| puts trace['trace'] }
  puts ''
end

def execute_request(request)
  begin
    puts_request request
    response = request.execute
    puts_response response
  rescue RestClient::Exception => e
    puts_response_error e
    #raise e
  end
  response
end