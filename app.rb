require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  @all_words = Word.all()
  erb(:index)
end

get('/words/new') do
  erb(:words_form)
end

post('/') do
  word = params.fetch("word")
  Word.new(word).save()
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

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:index)
end
