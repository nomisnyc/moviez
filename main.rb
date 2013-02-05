require 'pg'
require 'pry'
require 'httparty'
require 'json'
require 'rainbow'


# conn = PG.connect(:dbname =>'moviez', :host => 'localhost')
#  conn.exec( "select * from movies" ) do |result|
#    result.each do |row|
#       end
#     end

def menu()
  puts `clear`
  puts "\n\n ---Welcome to Moviez DB---\n\n"
   print "(S)earch Movies\n(V)iew Database\n(Q)uit\n\n".foreground(:blue)
  gets.chomp.downcase
end



response = menu

while response != 'q'
  case response
  when 's'

    print 'Movie Title: '.foreground(:blue)
    title = gets.chomp.split.join("+")
    results = HTTParty.get("http://www.omdbapi.com/?i=&t=#{title}")
    results = JSON(results.body)
    puts results.values.join("\n").foreground(:blue)
    sql = "insert into movies (title, year, rated, released, runtime, genre, director, writer, actors, plot, poster, rating, votes, imdb_id) values ('#{results['Title']}', '#{results['Year']}', '#{results['Rated']}', '#{results['Released']}', '#{results['Runtime']}', '#{results['Genre']}', '#{results['Director']}', '#{results['Writer']}', '#{results['Actors']}', '#{results['Plot']}', '#{results['Poster']}', '#{results['imdbRating']}', '#{results['imdbVotes']}', '#{results['imdbID']}')"
    conn.exec(sql)
  when 'v'

    conn.exec( "select * from movies" ) do |result|
      result.each do |row|
        puts row.values
        get
      end
      response = menu
      conn.close



end
end
end
