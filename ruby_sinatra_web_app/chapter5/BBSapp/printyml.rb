# frozen_string_literal: true

require 'yaml'

d = YAML.load_file('database.yml')
puts d
