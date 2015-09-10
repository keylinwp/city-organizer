$LOAD_PATH << '.'
require 'city'

module CitiesByPopulation 
  
  FILE_NAME = 'Cities_By_Population.txt'

  def sort_cities_by_population(cities)
    file = File.open(FILE_NAME, 'w') do |file|
    text_to_save = construct_city_by_population(cities)
    file.puts text_to_save
    end  
  end
    
  def construct_city_by_population(cities)
    text_to_save = ""
    text_to_save +=  sort_population(cities, text_to_save)
  end

  def write_city(city)
    text_to_save = ""
    city.each do |city_under_population|
      interstate = city_under_population.interstate.sort!.join(", ")
      text_to_save += "\n#{city_under_population.city}, #{city_under_population.state}\nInterstates: #{interstate}\n"
    end
    text_to_save
  end

  def sort_population(cities, text_to_save)
    cities = cities.sort_by(&:population).reverse.group_by(&:population)
    cities.each do |population, city|
      text_to_save += "\n#{population.to_s}"
      text_to_save += write_city(city)
    end
    text_to_save  
  end
 
end
