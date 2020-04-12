require 'sinatra'
require 'faraday'
require 'thin'
require_relative './services/stackoverflow_service'
require_relative './services/github_service'

class ApiEndpoint < Sinatra::Base
  get '/' do
    'Hello!'
  end

  get '/so_badges' do
    so_service = StackOverflowService.new(request.env['HTTP_UID'], request.env['HTTP_TOKEN'])
    response = so_service.get_badges
    response.body
  end

  get '/gh_user' do
    gh_service = GithubService.new(request.env['HTTP_USERNAME'])
    response = gh_service.get_info
    response.body
  end
end
