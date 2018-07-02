def main(input_file)
  #Check if stdin exists
  if $stdin.tty?
    input_file = $stdin
  end


  #Create hash of mod IDs
  mods = Hash.new(0)
  total = 0

  #Read each line to check for the name of the mod the item belongs to
  input_file.each do |line|
    item_name = line.split(/,+/)[1]
    # puts item_name
    mod_name = item_name[1..item_name.index(':') - 1]
    mods[mod_name] += 1
    total += 1
  end

  #Sort hash by the number of item IDs a mod uses in descending order
  mods.sort_by {|key, value| value}.reverse.each do |key, value|
    puts "#{key} : #{value}, #{((value.to_f / total) * 100.0).round(2)}%"
  end

  #Print out usage information
  puts "#{total}/4096 (#{(total / 4096.0 * 100).round(2)}%) IDs used"
  puts "#{4096 - total} block IDs remaining"
end

#Finds tellme folder and use latest block id csv
tellme_folder = Dir["../config/tellme/blocks-id-to-registryname-csv*"]
latest_file = tellme_folder.sort {|a, b| b <=> a}[0]

main(File.new(latest_file))