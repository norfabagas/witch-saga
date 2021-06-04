require 'rails_helper'

RSpec.describe Person, type: :model do
  it "is valid with valid attribute" do
    person = Person.new("John", 5, 6)
    expect(person.born_on_year).to eq(1)
    expect(person.is_valid).to eq(true)
  end

  it "is invalid with invalid attribute" do
    person = Person.new("John", 6, 5)
    expect(person.born_on_year).to eq(-1)
    expect(person.is_valid).to eq(false)
    
    person2 = Person.new("John", 6, 5)
    expect(person2.born_on_year).to eq(-1)
    expect(person2.is_valid).to eq(false)
  end
end
