# -*- coding: utf-8 -*-
require 'sinatra'
require 'sequel'
require 'json'

class Base
  DB = Sequel.connect('sqlite://blog.db')

  def initialize
    @db = DB.from self.class.to_s
  end
end

class Article < Base
  def article_by(key, value)
    case key
    when :id
      @db.filter(:id => value.to_i).first
    else
      nil
    end
  end
end

get '/' do
  erb :index
end

get '/edit' do
  erb :edit
end

post '/submit' do
  title = params[:title]
  content = params[:content]
  DB[:article].insert(
    :title => title,
    :body => content
  )
  'success'
end

get '/article/:id' do
  article = Article.new.article_by(:id, params[:id])
  return 404 unless article
  @title = article[:title]
  @content = article[:body]
  erb :article
end

get '/api/article/:id' do
  article = Article.new.article_by(:id, params[:id])
  return 404 unless article
  JSON::generate article
end

