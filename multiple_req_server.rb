require 'socket'
require 'byebug'

app = Proc.new do |env|
  ['200', {'Content-Type' => 'text/html'},["Hello! You hit the request at #{Time.now}"]]
end

server = TCPServer.new  5678

while session = server.accept
  request = session.gets 
  puts request 

  status, headers, body = app.call({})
  
  session.print "HTTP/1.1 #{status}\r\n"

  headers.each do |key, value|
    session.print "#{key}: #{value}\r\n"
  end 

  session.print "\r\n"

  body.each do |part|
    session.print part
  end
  session.close

end