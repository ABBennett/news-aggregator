require 'pry'
require 'sinatra'
require 'CSV'

get '/articles' do

  @articles = []
  CSV.foreach('articles.csv', headers: true, header_converters: :symbol) do |row|
    article = row.to_hash
    @articles << article
    

  end

  erb :index
end

post '/articles' do

  article_title = params['article_title']
  url = params['url']
  description = params['description']

  article_array = [article_title,url,description]

  CSV.open("articles.csv", 'a') do |file|
    file << article_array

  end


  redirect '/articles'
end

get '/articles/new' do
  erb :new
end
