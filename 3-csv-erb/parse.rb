#h1 with the total money we made this week
#List of all Shipments (create a table with the shipments listed)
#List of all employees and their number of trips and bonus
#Pie chart of the Money each employee delivered
#A gif, preferably related to Fry, Amy, Bender, and/or Leela

#bonus is 10% of money

require 'csv'
require 'erb'

#{"Destination"=>"Earth", "Shipment"=>"Hamburgers", "Crates"=>150.0, "Money"=>30000.0}
#{"Destination"=>"Moon", "Shipment"=>"Tacos", "Crates"=>33.0, "Money"=>44500.0}
#{"Destination"=>"Earth", "Shipment"=>"Movies", "Crates"=>34.0, "Money"=>5000.0}
#{"Destination"=>"Mars", "Shipment"=>"BBQ Sauce", "Crates"=>999.0, "Money"=>15000.0}
#{"Destination"=>"Uranus", "Shipment"=>"Whiskey", "Crates"=>1000.0, "Money"=>345600.0}
#{"Destination"=>"Jupiter", "Shipment"=>"Books", "Crates"=>10.0, "Money"=>3451.0}
#{"Destination"=>"Pluto", "Shipment"=>"Beer", "Crates"=>100.0, "Money"=>2344.0}
#{"Destination"=>"Uranus", "Shipment"=>"Pizza", "Crates"=>66.0, "Money"=>10000.0}
#{"Destination"=>"Saturn", "Shipment"=>"Pizza", "Crates"=>26.0, "Money"=>1000.0}
#{"Destination"=>"Mercury", "Shipment"=>"Pizza", "Crates"=>36.0, "Money"=>80000.0}




shipments = []
CSV.foreach("planet_express_logs.csv", headers: true) do |row|
  shipment = row.to_hash
  shipment["Crates"] = shipment["Crates"].to_f
  shipment["Money"] = shipment["Money"].to_f
  shipments << shipment
end

totalmoney = []
shipments.each do |shipment|
  totalmoney << shipment["Money"]
end

revenue = totalmoney.reduce(:+)
puts revenue

bender = []
amy = []
fry = []
leela = []

shipments.each do |shipment|
  case shipment["Destination"]
  when "Earth"
    fry << shipment
  when "Mars"
    amy << shipment
  when "Uranus"
    bender << shipment
  else
 leela << shipment
end
end
puts "======================"
earth = []
moon = []
mars = []
uranus = []
jupiter = []
pluto = []
saturn = []
mercury = []

shipments.each do |shipment|
  case shipment["Destination"]
  when "Earth"
    earth << shipment["Money"]
  when "Moon"
    moon << shipment["Money"]
  when "Mars"
    mars << shipment["Money"]
  when "Uranus"
    uranus << shipment["Money"]
  when "Jupiter"
    jupiter << shipment["Money"]
  when "Pluto"
    pluto << shipment["Money"]
  when "Saturn"
    saturn << shipment["Money"]
  when "Mercury"
    mercury << shipment["Money"]
  end
end
earthtotal = earth.reduce(:+)
moontotal = moon.reduce(:+)
marstotal = mars.reduce(:+)
uranustotal = uranus.reduce(:+)
jupitertotal = jupiter.reduce(:+)
plutototal = pluto.reduce(:+)
saturntotal = saturn.reduce(:+)
mercurytotal = mercury.reduce(:+)

puts earthtotal
puts moontotal
puts marstotal
puts uranustotal
puts jupitertotal
puts plutototal
puts saturntotal
puts mercurytotal


puts "======================"

puts fry
frymoney=[]
fry.each do |fry|
  frymoney << fry["Money"]
end
frytotal = 0
fry.each do
  frytotal +=1
end
puts frytotal

fryrevenue = frymoney.reduce(:+)
frybonus = (frymoney.reduce(:+)) * 0.1
puts frybonus

puts "======================"

puts amy
amymoney=[]
amy.each do |amy|
  amymoney << amy["Money"]
end
amytotal = 0
amy.each do
  amytotal +=1
end
puts amytotal

amyrevenue = amymoney.reduce(:+)
amybonus = (amymoney.reduce(:+)) * 0.1
puts amybonus

puts "======================"

puts bender
bendermoney=[]
bender.each do |bender|
  bendermoney << bender["Money"]
end
bendertotal = 0
bender.each do
  bendertotal +=1
end
puts bendertotal

benderrevenue = bendermoney.reduce(:+)
benderbonus = (bendermoney.reduce(:+)) * 0.1
puts benderbonus

puts "======================"

puts leela

leelamoney=[]
leela.each do |leela|
  leelamoney << leela["Money"]
end
leelatotal = 0
leela.each do
  leelatotal +=1
end
puts leelatotal

leelarevenue = leelamoney.reduce(:+)
leelabonus = (leelamoney.reduce(:+)) * 0.1
puts leelabonus

puts "======================"



# read the template
template = File.read("template.html.erb")
# compile the ERB
output_html = ERB.new(template).result(binding)
# write to the file
File.open("index.html", "wb") {|file| file << output_html}
