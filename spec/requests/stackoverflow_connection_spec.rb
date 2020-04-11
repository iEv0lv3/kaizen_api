require 'spec_helper'

RSpec.describe 'StackOverflow API Service', type: :request do
  def app
    ApiEndpoints
  end

  it 'should be able to go to the home page', :vcr do
    get '/'

    expect(last_response).to be_successful
  end

  it 'retrieves badges as JSON', :vcr do
    get '/so_endpoint'

    expect(last_response).to be_successful
  end
end
