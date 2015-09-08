$LOAD_PATH << '.'
require 'city'

module InterstatesByCities 
  
  def sort_interstates_by_city(cities)
    sorted_interstates = order_interstate_by_city(cities)
    File.open('Interstates_By_City.txt', 'w') do |file|
      sorted_interstates.each do |interstate, number_of_cities|
        text_to_save = "I-#{interstate.to_i} #{number_of_cities}\n"
        file.puts text_to_save
      end
    end
  end
    
  def order_interstate_by_city(cities)
    interstates = cities.map(&:interstate).flatten!
    sorted_interstate_by_cities = interstates.each_with_object(Hash.new(0)) {|interstate,counter| counter[interstate] += 1}
    sorted_interstate_by_cities.sort#.reverse!
  end

end
