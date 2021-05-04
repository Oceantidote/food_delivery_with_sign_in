class View
  def list(things)
    if things.empty?
      puts "nothing added yet"
    else
      type = things.first.class.to_s
      puts type + "s"
      things.each do |thing|
        puts "#{thing.id} - #{thing.name} - #{type == "Meal" ? thing.price : thing.address}"
      end
    end
  end

  def ask(thing)
    puts "Please enter your #{thing}"
    gets.chomp
  end
end

