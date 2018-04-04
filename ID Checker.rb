mods = Hash.new(0)
total = 0
$stdin.each do |line|
    itemName = line.split(/,+/)[1]
    # puts itemName
    modName = itemName[1..itemName.index(':')-1]
    mods[modName] += 1
    total += 1
end
mods.each do |key, value|
    puts "#{key} : #{value}"
end
puts total
mods.each do |key, value|
    puts "#{key} : #{(value/total)*100}"
end
