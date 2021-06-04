require 'rails_helper'
require './spec/support/fibonacci_helper'

RSpec.configure do |c|
  c.include FibonacciHelper
end

RSpec.describe Number, type: :model do
  it 'is valid with valid attribute' do
    n = Number.new(5)
    expect(n.get_year).to eq(5)
  end

  it 'is invalid without valid attribute' do
    n = Number.new("a")
    expect(n.get_year).to eq(-1)
  end

  it 'has valid fibonacci calculation' do
    n = Number.new(4)
    expect(n.print_calculation.last).to eq(fibonacci(4))
    
    n = Number.new(6)
    expect(n.print_calculation.last).to eq(fibonacci(6))
  end
end
