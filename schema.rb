# -*- coding: utf-8 -*-
require 'sequel'

DB = Sequel.connect 'sqlite://blog.db'

DB.create_table? :article do
  primary_key :id
  String :title
  Blob :body
  DateTime :created_at, :default => Time.now
  DateTime :updated_at, :default => Time.now
end

