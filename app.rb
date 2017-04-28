require('sinatra')
require('sinatra/reloader')
require('./lib/words.rb')
also_reload('lib/**/*.rb')



get('/') do
  erb(:index)
end

get('/list') do
  @words = Word.all()
  erb(:word_list)
end

post('/list') do
  word=params.fetch('word')
  definition=params.fetch('definition')
  new_def = Definition.new({:definition => definition})
  new_word = Word.new({:headword => word})
  new_word.add_definition(new_def)
  new_word.save()
  @words = Word.all()
  erb(:word_list)
end

get('/new_entry') do
  erb(:form)
end

get('/word/:id') do
  @word = Word.find(params.fetch("id").to_i)
  erb(:each_word)
end

post('/word/:id') do
  definition = Definition.new(:definition => (params.fetch('definition')))
  @word = Word.find(params.fetch("id").to_i)
  @word.add_definition(definition)
  erb(:each_word)
end
