require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @dictionary = Word.sorted
  erb(:dictionary)
end

get('/dictionary') do
  @dictionary = Word.sorted
  erb(:dictionary)
end

post('/dictionary') do
  name = params[:word_name]

  word = Word.new(name, nil)
  word.save()
  @dictionary = Word.sorted
  erb(:dictionary)
end

get('/dictionary/new') do
  erb(:new_word)
end

get('/dictionary/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end
