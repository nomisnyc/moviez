require 'pg'
require 'pry'


conn = PG.connect(:dbname =>'moviez', :host => 'localhost')
conn.exec( "select * from ,moviez" ) do |result|
  result.each do |row|
  end
end


conn.close


print '\n\n\n -----Welcome To MoviezDB----'
print 'Type in the name of the movie that you want more details about'
movie_name = gets.chomp.downcase.split


sql = "insert into moviez (, last, dob, relationship, city) values ('#{name[0]}', '#{name[1]}', '#{dob}', '#{rel}', '#{city}');"

conn.exec(sql)
conn.close