require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  erb(:index)
end

get('/all_words') do
  @all_words = Word.all()
  erb(:all_words)
end

get('/new_words/form') do
  erb(:new_words_form)
end

get('/all_words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:individual_word)
end

post('/all_words') do
  @word = params.fetch("word")
  Word.new({:word => @word}).save()
  @all_words = Word.all()
  erb(:success)
end
