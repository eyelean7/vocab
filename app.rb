require('sinatra')
require('sinatra/reloader')
require('./lib/words.rb')
also_reload('lib/**/*.rb')


get('/') do
  erb(:index)
end
