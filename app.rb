require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @dictionary = Word.all
  erb(:dictionary)
end

get('/dictionary') do
  redirect to ('/')
end

post('/dictionary') do
  name = params[:word_name]

  word = Word.new(name)
  word.save
  redirect to ('/')
end
