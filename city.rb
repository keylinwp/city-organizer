class City
    
  attr_reader :city, :state, :population, :interstate

  def initialize (city, state, population, interstate)
    @city = city
    @state = state
    @population = population.to_i
    @interstate = interstate
  end
    
end
