# frozen_string_literal: true

require 'active_record'

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection :development

class BBSdata < ActiveRecord::Base
  self.table_name = 'bbsdata'
end

a = BBSdata.find(1)

puts "#{a.id}, #{a.name}, #{a.entry}"
