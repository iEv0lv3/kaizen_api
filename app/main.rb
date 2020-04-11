require 'sinatra'
require 'faraday'
require 'thin'
require_relative './services/stackoverflow_service'
require_relative './services/github_service'

class ApiEndpoint < Sinatra::Base
  get '/' do
    'Hello!'
  end

  get '/badges' do
    so_service = StackOverflowService.new(4947551)
    response = so_service.get_badges
    response.body
  end

  get '/gh_user' do
    gh_service = GithubService.new('alerrian')
    response = gh_service.get_info
    response.body
  end
end

  # private

  # def get_json(url)
  #   response = conn.get(url)
  #   JSON.parse(response.body, symbolize_names: true)
  # end

  # def conn
  #   Faraday.new(url: 'https://api.stackexchange.com/')
  #   end
  # end
