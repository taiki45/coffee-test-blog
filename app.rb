# -*- coding: utf-8 -*-
require 'sinatra'
require 'sequel'
require 'json'
require 'singleton'

$LOAD_PATH.unshift File.expand_path('../', __FILE__)
require 'models'

get '/' do
  erb :index
end

get '/edit' do
  erb :edit
end

post '/submit' do
  id = Article.new_article(params[:title], params[:content])
  JSON::generate Article.article_by(:id, 5)
end

get '/article' do
  @articles = Article.all
  erb :all_article
end

get '/article/:id' do
  article = Article.article_by(:id, params[:id])
  return 404 unless article
  @title = article[:title]
  @content = article[:body]
  erb :article
end

get '/api/article/:id' do
  article = Article.article_by(:id, params[:id])
  return 404 unless article
  JSON::generate article
end

