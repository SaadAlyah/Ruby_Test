require 'rails_helper'

describe  'Test API', type: :request do
  it 'should return all tests' do

    FactoryBot.create(:test, name: 'test1', address: 'testAddress1')
    FactoryBot.create(:test, name: 'test2', address: 'testAddress2')

    get '/api/v1/test'

    expect(response).to have_http_status(:success)

    expect(JSON.parse(response.body).size).to eq(2)
  end
end