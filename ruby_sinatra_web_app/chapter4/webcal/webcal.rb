# frozen_string_literal: true

require 'sinatra'

set :environment, :production

get '/:y/:m' do
  @year = params[:y]
  @month = params[:m]

  erb :moncal
end
