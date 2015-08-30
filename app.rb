require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')

get('/') do
  @all_words = Word.all()
  erb(:index)
end

get('/words/new') do
  erb(:words_form)
end

post('/') do
  word = params.fetch("word")
  new_word = Word.new({:word => word})
  new_word.save()
  @all_words = Word.all()
  erb(:index)
end

get('/word/:id') do
  @word = Word.find(params.fetch('id').to_i())

  erb(:word)
end

post('/add/definition') do
  @word = Word.find(params.fetch('id').to_i())
  new_definition = params.fetch('definition')
  @word.add_definition(Definition.new(new_definition))
  @all_words = Word.all()
  erb(:index)
end
