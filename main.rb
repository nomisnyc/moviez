require 'pg'
require 'pry'

conn = PG.connect(:dbname =>'moviez', :host => 'localhost')
conn.exec( "select * from movies" ) do |result|
  result.each do |row|
  end
end

