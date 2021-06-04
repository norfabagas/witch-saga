class Number

  attr_accessor :fibonacci

  def initialize(year)
    @year = year.to_i
    generate_fibonacci_sequences
  end

  def get_year
    is_valid_year? ? @year : -1
  end

  def print_calculation
    @fibonacci
  end
  
  def sum_calculation
    @fibonacci.sum
  end
  
  private
  
  def is_valid_number?
    @year.is_a? Integer
  end

  def is_valid_year?
    is_valid_number? &&  @year > 0
  end

  def generate_fibonacci_sequences
    # initialize empty fibonacci array
    self.fibonacci = []

    # helper vars
    n = @year
    first=0
    second=1
    next_term=0
    c=1

    while(c <= n + 1)
      if(c <= 1)
        next_term = c
      else
        @fibonacci << next_term
        next_term = first + second
        first = second
        second = next_term
      end
      c += 1
    end

end

end
