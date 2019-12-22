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

get('/dictionary/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/dictionary/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:word_name])
  @dictionary = Word.sorted
  erb(:dictionary)
end

delete('/dictionary/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @dictionary = Word.sorted
  erb(:albums)
end

get('dictionary/:id/definition/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:definition)
end
