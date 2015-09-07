$LOAD_PATH << '.'
require 'city'

module CitiesByPopulation 
      
  def sort_cities_by_population(cities)
      file = File.open('Cities_By_Population.txt', 'w') do |file|
      text_to_save = construct_city_by_population(cities)
      file.puts text_to_save
    end  
  end
    
  def construct_city_by_population(cities)
    text_to_save=""
    cities.sort_by(&:population).reverse.group_by(&:population).each do |population, city|
      text_to_save += "\n#{population.to_s}"
      city.each do |city_under_population|
        interstate = city_under_population.interstate.sort!.join(", ")
        text_to_save += "\n#{city_under_population.city}, #{city_under_population.state}\nInterstates: #{interstate}\n"
      end
    end
    text_to_save
  end
  
end

