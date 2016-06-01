# Create an array of movies with budgets less than 100
# Create an array of movies that have Leonardo DiCaprio as a star

movies = []

movies << {
  title: "Forest Gump",
  budget: 55,
  stars: ["Tom Hanks"]
}
movies << {
  title: "Star Wars",
  budget: 11,
  stars: ["Mark Hamill", "Harrison Ford"]
}
movies << {
  title: "Batman Begins",
  budget: 150,
  stars: ["Christian Bale", "Liam Neeson", "Michael Caine"]
}
movies << {
  title: "Titanic",
  budget: 200,
  stars: ["Kate Winslet", "Leonardo DiCaprio"]
}
movies << {
  title: "Inception",
  budget: 160,
  stars: ["Leonardo DiCaprio", "JGL"]
}

cheap = movies.select {|movie| movie[:budget] < 100}
puts cheap.inspect
puts " "
leo = movies.select {|movie| movie[:stars].include? "Leonardo DiCaprio"}
puts leo.inspect.chomp
