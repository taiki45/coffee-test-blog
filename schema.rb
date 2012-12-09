# -*- coding: utf-8 -*-
require 'sequel'

DB.create_table :article do
  primary_key :id
  String :title
  Blob :body
  Date :created_at
  Date :updated_at
end

