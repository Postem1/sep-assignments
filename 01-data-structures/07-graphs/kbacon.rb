class Actor
  attr_accessor :movies
  attr_reader :name
  attr_accessor :searched

  def initialize(name)
    @name = name
    @movies = Array.new
    @searched = false
  end

  def add_movie(movie)
    @movies.push(movie)
  end
end

class Movie
  attr_accessor :cast
  attr_reader :title
  # attr_accessor :parent  #used to traverse

  def initialize(title)
    @title = title
    @cast = Array.new
  end

  def add_actor(actor)
    @cast.push(actor)
  end
end

def add_actor_to_movie(actor, movie)
  actor.add_movie(movie)
  movie.add_actor(actor)
end

$bacon = Actor.new("Kevin Bacon")
wild = Movie.new("Wild Things")
add_actor_to_movie($bacon, wild)

def find_kevin_bacon(actor, films = [])
#cycle through each of the actor's movie to see if Kevin Bacon was in it
  actor.movies.each do |movie|
    unless films.include?(movie.title)
      films.push(movie.title)
    end
    if movie.cast.include?($bacon)
      if (films.length <= 6)
        return films
      end
    else # current movie doesn't include Kevin Bacon
      actor.searched = true
      movie.cast.each do |acteur|
        if acteur.searched == false
          return find_kevin_bacon(acteur, films)
        end
      end
    end
  end
  return nil
end

bob = Actor.new("Bob")
jim = Actor.new("Jim Carrey")
greg =  Actor.new("Greg")
eddie = Actor.new("Eddie Murphy")
mike = Actor.new("Mike Myers")
james = Actor.new("James Cromwell")
laurie = Actor.new("Laurie Wallace")
googy = Actor.new("Googy Gress")
patrick = Actor.new("Patrick Stewart")
will = Actor.new("Will Smith")
rene = Actor.new("Rene Zellweger")

shrek = Movie.new("Shrek")
pink = Movie.new("Pink Cadillac")
oscar = Movie.new("Club Oscar")
my_one = Movie.new("My One and Only")
big_daddy = Movie.new("Big Daddy")
matrix = Movie.new("Matrix")
beyond = Movie.new("Beyond all Boundaries")
holy = Movie.new("Holy Man")
nixon = Movie.new("Frost Nixon")
apollo = Movie.new("Apollo 13")
wayne2 = Movie.new("Wayne's World 2")

add_actor_to_movie(bob, big_daddy)
add_actor_to_movie(bob, matrix)

add_actor_to_movie(greg, matrix)

add_actor_to_movie(eddie, shrek)
add_actor_to_movie(eddie, holy)

add_actor_to_movie(mike, shrek)
add_actor_to_movie(mike, wayne2)

add_actor_to_movie(jim, pink)

add_actor_to_movie(googy, nixon)
add_actor_to_movie(googy, apollo)
add_actor_to_movie(googy, wayne2)

add_actor_to_movie(rene, my_one)
add_actor_to_movie(rene, oscar)

add_actor_to_movie(james, beyond)
add_actor_to_movie(james, pink)

add_actor_to_movie(laurie, wild)
add_actor_to_movie(laurie, holy)

add_actor_to_movie(will, oscar)


add_actor_to_movie($bacon, beyond)
add_actor_to_movie($bacon, nixon)
add_actor_to_movie($bacon, my_one)
add_actor_to_movie($bacon, apollo)

films = find_kevin_bacon(mike)

unless films.nil?
  puts "Films: #{films}"
else
  puts "No path to Bacon"
end
