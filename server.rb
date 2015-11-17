require 'pry'
require 'sinatra'

get '/articles' do
  @articles = File.readlines("articles.csv")
  @urls = File.readlines("urls.csv")
  @descriptions = File.readlines("descriptions.csv")
  erb :index
end

post '/articles' do

  article = params['article']
  url = params['url']
  description = params['description']

  File.open("articles.csv", 'a') do |file|
    file.puts(article)
  end

  File.open("urls.csv", 'a') do |file|
    file.puts(url)
  end

  File.open("descriptions.csv", 'a') do |file|
    file.puts(description)
  end

  redirect '/articles'
end

get '/articles/new' do
  erb :new
end
