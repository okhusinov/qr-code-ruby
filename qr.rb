require "rqrcode"

puts "What kind of QR code would you like to generate?"
puts
puts "1. Open a URL"
puts "2. Join a wifi network"
puts "3. Send a text message"
puts
puts "Press 4 to exit"
puts

kind_of_code = gets.chomp
puts

if kind_of_code.include?("4")
  puts "Goodbye!"
  exit
elsif kind_of_code.include?("1")
  puts "What's the URL you would like to encode?"
  puts

  text_to_encode = gets.chomp
  puts
elsif kind_of_code.include?("2")
  puts "What's the name of the wifi network?"
  puts

  network_name = gets.chomp
  puts

  puts "What's the password?"
  puts

  networ_password = gets.chomp
  puts

  text_to_encode = "WIFI:T:WPA;S:#{network_name};P:#{network_password};;"
elsif kind_o_code.include("3")
  puts "What is the phone number you want the code to send a text message to?"
  puts

  phone_number = gets.chomp
  puts

  puts "What you want to populate the message with?"
  puts

  message_body = gets.chomp
  puts

  text_to_encode = "SMTO:#{phone_number}:#{message_body}"
else
  puts "Didn't recognize that selection. Please try again."
  exit
end

puts "What would you like to call the png?"
puts

filename = gets.chomp
puts

# Use the RQRCode::QRCode class to encode some text
qrcode = RQRCode::QRCode.new(text_to_encode)

# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
IO.binwrite("#{filename}.png", png.to_s)
