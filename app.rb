# -*- coding: utf-8 -*-
require 'sinatra'
require 'sequel'
require 'json'
require 'pry'

$LOAD_PATH.unshift File.expand_path('../', __FILE__)
require 'models'

get '/' do
  erb :index
end

get '/edit' do
  @articles = Article.all.reverse
  erb :edit
end

post '/submit' do
  article = Article.create(:title=>params[:title], :body=>params[:content])
  article.values.to_json
end

get '/article' do
  @articles = Article.all
  erb :all_article
end

get '/article/:id' do
  article = Article[params[:id]]
  return 404 unless article
  @title = article[:title]
  @content = article[:body]
  erb :article
end

get '/api/article/:id' do
  article = Article[params[:id]]
  article ? article.to_json : 404
end

