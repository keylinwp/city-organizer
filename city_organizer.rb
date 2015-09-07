$LOAD_PATH << '.'
require 'city'
require 'cities_by_population'
require 'interstates_by_cities'

class CityOrganizer 

  include InterstatesByCities
  include CitiesByPopulation

  def initialize
    @cities = build_cities
    sort_cities
  end

  def build_cities
    lines = File.readlines(obtain_filename)
    lines.map do |line|
      city_information = line.split("|")
      interstates = refact_interstates(city_information[3])
      City.new(city_information[1], city_information[2], city_information[0], interstates)
    end
  end

  def obtain_filename
    puts "Enter a File: "
    file  = gets.chomp
  end

  def refact_interstates(interstates)
    interstates = interstates.split(";").each(&:strip!)
    interstates.map! {|x| x.split("-")[1].to_i} 
  end
  
  def sort_cities
    sort_cities_by_population(@cities)
    sort_interstates_by_city(@cities)
    puts "Sorted files done"
  end
   
  x = CityOrganizer.new()

end