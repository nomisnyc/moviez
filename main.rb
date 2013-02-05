require 'pg'
require 'pry'
require 'httparty'
require 'json'


conn = PG.connect(:dbname =>'moviez', :host => 'localhost')
# conn.exec( "select * from movies" ) do |result|
#   result.each do |row|
#   end
# end

# puts "(S)earch Movies\n(V)iew Database\n(Q)uit"
# response = gets.chomp.downcase

# while response != 'q'

#   if response == 's'

    print 'Movie Title: '
    title = gets.chomp.split.join("+")
    results = HTTParty.get("http://www.omdbapi.com/?i=&t=#{title}")
    results = JSON(results.body)

    puts results.values.join("\n")

    sql = "insert into movies (title, year, rated, released, runtime, genre, director, writer, actors, plot, poster, rating, votes, imdb_id) values ('#{results['Title']}', '#{results['Year']}', '#{results['Rated']}', '#{results['Released']}', '#{results['Runtime']}', '#{results['Genre']}', '#{results['Director']}', '#{results['Writer']}', '#{results['Actors']}', '#{results['Plot']}', '#{results['Poster']}', '#{results['imdbRating']}', '#{results['imdbVotes']}', '#{results['imdbID']}')"

    conn.exec(sql)

#   elsif response == 'v'

#     conn.exec( "select * from movies" ) do |result|
#       result.each do |row|
#         puts row.values
#       end
#     end

#   else

#     puts "Thank you"

#   end

# end

conn.close
