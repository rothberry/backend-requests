class NasaApiController < ApplicationController
  BASE_URL = "https://api.nasa.gov/"
  API_KEY = ENV["API_KEY"]
  # Example url
  # https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY

  def apod_get # get '/apod'
    # Build the full URL with API key
    full_url = BASE_URL + "planetary/apod?api_key=" + API_KEY
    uri = URI(full_url)
    response = Net::HTTP.get(uri)
    parsed_response = JSON.parse(response)
    # debugger
    render json: parsed_response, status: parsed_response["error"] ? 403 : :ok
  end

  def apod
    full_url = BASE_URL + "planetary/apod?api_key=" + API_KEY
    response = HTTParty.get(full_url)
    render json: response, status: response["error"] ? 403 : :ok
  end

end
