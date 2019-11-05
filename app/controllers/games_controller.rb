require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = (0...10).map { ('A'..'Z').to_a[rand(10)] }
  end

  def score
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"

    html_doc = JSON.parse(open(url).read)
    @found = html_doc["found"]

    if @found == false
      @answer = "Sorry but #{@word.upcase} is not an english word..."
    else
      @answer = "nice"
    end
  end
end
