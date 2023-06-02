# frozen_string_literal: true

require 'sinatra'

set :environment, :production

get '/' do
  'Hello, A Whole New World.'
end
