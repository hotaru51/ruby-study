# frozen_string_literal: true

require 'sinatra'

set :environment, :production

get '/' do
  @msg = 'WHAT YOU ARE.'
  erb :index
end
