require 'rest-client'
require 'json'
require 'pry'
=begin
**So, the `get_character_movies_from_api` method should return an array of hashes, where each hash represents a movie.**
This array of hashes is what gets passed to the `print_movies` method.
This is the method in which you will iterate over that array of hashes to `puts` out movie information to the terminal.
=end
def get_character_movies_from_api(character1)
  #make the web request
  array = []
  character_data = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(character_data)
  response_hash["results"].each do |x|
    # qbinding.pry
  if x["name"] == character1
   film_api = x["films"]
    film_api.each do |x|
    # binding.pry
    film_data = RestClient.get(x)
     film_hash = JSON.parse(film_data) #parse the string into a hash
     array << film_hash["title"]
      end
    end
  end
  array
end
def print_movies(array)
  # some iteration magic and puts out the movies in a nice list
  array.each_with_index do |value, index|
    #binding.pry
    puts "#{index + 1}: #{value}"
  end
end
def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end
#show_character_movies("Luke Skywalker")
## BONUS
# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
