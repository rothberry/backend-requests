class ApiController < ApplicationController
  BASE_URL = "https://api.nasa.gov/"
  API_KEY = ENV["API_KEY"]

  def apod_net
    full_url = BASE_URL + "planetary/apod?api_key=" #+ API_KEY
    uri = URI(full_url)
    first_response = Net::HTTP.get(uri)
    better_response = JSON.parse(first_response)
    # render json: better_response, status: :ok, only: ["date", "explanation"]
    render json: better_response, status: better_response["error"] ? 403 : :ok
  end

  def apod
    full_url = BASE_URL + "planetary/apod?api_key=" + API_KEY
    full_response = HTTParty.get(full_url)
    render json: full_response, status: full_response["error"] ? 403 : :ok
  end

  def an_auth_one
    full_url = BASE_URL + "planetary/apod"
    res = HTTParty.get(full_url, headers: {
       "content-type": "application/json", 
       "Authorization": "Bearer #{API_KEY}" 
      })
  end
end
