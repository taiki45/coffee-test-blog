# -*- coding: utf-8 -*-

class Base
  def self.init
    @db ||= Sequel.connect('sqlite://blog.db').from self.name
  end
end

class Article < Base
  self.init
  class << self

    def all
      @db.all
    end

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
end

