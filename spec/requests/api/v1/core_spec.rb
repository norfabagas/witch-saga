require 'rails_helper'

RSpec.describe "Api::V1::Cores", type: :request do
  describe "POST /solution" do
    it "should output correct result" do
      params = {
        format: 'json',
        core: {
          "name_1": "john",
          "age_of_death_1": 10,
          "year_of_death_1": 12,
          "name_2": "john",
          "age_of_death_2": 13,
          "year_of_death_2": 17
        }
      }

      post '/api/v1/solution.json', params: params
      body = JSON.parse(response.body)
      puts body
      expect(body['result']).to eq(4.5);
    end

    it "should output correct result again" do
      params = {
        format: 'json',
        core: {
          "name_1": "john",
          "age_of_death_1": 10,
          "year_of_death_1": 14,
          "name_2": "john",
          "age_of_death_2": 10,
          "year_of_death_2": 15
        }
      }

      post '/api/v1/solution.json', params: params
      body = JSON.parse(response.body)
      puts body
      expect(body['result']).to eq(9.5);
    end

    it "should output -1 as result" do
      params = {
        format: 'json',
        core: {
          "name_1": "john",
          "age_of_death_1": 10,
          "year_of_death_1": 10,
          "name_2": "john",
          "age_of_death_2": 10,
          "year_of_death_2": 10
        }
      }

      post '/api/v1/solution.json', params: params
      body = JSON.parse(response.body)
      puts body
      expect(body['result']).to eq(-1);
    end
  end
end
