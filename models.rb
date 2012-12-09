# -*- coding: utf-8 -*-

class Base
  include Singleton

  def initialize
    @db ||= Sequel.connect('sqlite://blog.db').from self.class.to_s
  end

  def self.method_missing(name, *args)
    self.instance.__send__ name, *args
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

  def new_article(title, body)
    @db.insert(:title => title, :body => body)
  end
end

