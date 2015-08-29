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
  Word.new({:word => word}).save()
  @all_words = Word.all()
  erb(:index)
end

# post('/individual_word') do
#   @word=params.fetch("word")
#   @definition = params.fetch("definition")
#   @definition = Definition.new({:definition => @definition})
#   @definition.save()
#   @word = Word.find(params.fetch('id').to_i())
#   @word.add_email(@word)
#   erb(:individual_word)
# end

get('/word/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end
