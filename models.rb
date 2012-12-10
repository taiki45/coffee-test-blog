# -*- coding: utf-8 -*-

DB = Sequel.connect('sqlite://blog.db')

class Article < Sequel::Model; end

