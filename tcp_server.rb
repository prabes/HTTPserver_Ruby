 
require 'socket'
server = TCPServer.new 5678

while session = server.accept
  request = session.gets 
  puts request

  session.puts "HTTP/1.1 200\r\n"
  session.puts "Content-Type: text/html\r\n"
  session.puts "\r\n"
  session.puts "Hello World! The time is #{Time.now}" 
  
  session.close 
end 
