class Api::V1::CoreController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    render json: {
      text: "Hello, I am a superhero 🦸‍♂️",
      ability: "Coding 💻",
      purpose: "Defeat the witch 🧹",
      how: "By solving her coding challenge 📋"
    }
  end

  def killed_by_year
    number = Number.new(params[:year])
    if params[:year] && number
      render json: {
        year: number.get_year,
        num_sequences: number.print_calculation,
        people_killed: number.sum_calculation
      }
    else
      render json: {
        error: "Please provide a specific year parameter"
      }
    end
  end

  def person_information
    begin
      person = Person.new(
        person_params[:name],
        person_params[:age_of_death],
        person_params[:year_of_death]
      )
      render json: {
        person: person
      }
    rescue Exception => e
      render json: {
        error: "Please provide a full params (name, age_of_death, year_of_death)",
        e: e
      }
    end
  end

  def solution
    begin
      p1 = Person.new(
        persons_params[:name_1],
        persons_params[:age_of_death_1],
        persons_params[:year_of_death_1]
      )
      
      p2 = Person.new(
        persons_params[:name_2],
        persons_params[:age_of_death_2],
        persons_params[:year_of_death_2]
      )

      year1 = Number.new(p1.born_on_year)
      year2 = Number.new(p2.born_on_year)

      if p1.is_valid && p2.is_valid
        avg = (year1.sum_calculation.to_f + year2.sum_calculation.to_f) / 2
      else
        avg = -1
      end

      render json: {
        result: avg,
        person_1: p1,
        person_2: p2
      }

    rescue Exception => e
      render json: {
        error: "Please provide a full params (name, age_of_death, year_of_death)",
        e: e
      }
    end
  end

  private

  def person_params
    params
          .require( :core)
          .permit(  :name,
                    :age_of_death,
                    :year_of_death)
  end
  
  def persons_params
    params
          .require( :core)
          .permit(  :name_1,
                    :age_of_death_1,
                    :year_of_death_1,
                    :name_2,
                    :age_of_death_2,
                    :year_of_death_2)
  end
end
