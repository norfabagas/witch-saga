class Person

  attr_accessor :born_on_year
  attr_accessor :is_valid
  
  def initialize(name, age_of_death, year_of_death)
    @name = name
    @age_of_death = age_of_death.to_i
    @year_of_death = year_of_death.to_i
    after_initialize
  end

  private

  def valid_age_and_year?
    @age_of_death > 0 && 
    @year_of_death > 0 && 
    @age_of_death < @year_of_death
  end

  def after_initialize
    self.born_on_year = valid_age_and_year? ? 
                          @year_of_death - @age_of_death :
                          -1
    self.is_valid = self.born_on_year > -1
  end

end
