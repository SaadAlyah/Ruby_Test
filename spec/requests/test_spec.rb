require 'rails_helper'

describe 'Test API', type: :request do
  describe 'GET /test' do
    before do
      FactoryBot.create(:test, name: 'test1', address: 'testAddress1')
      FactoryBot.create(:test, name: 'test2', address: 'testAddress2')
    end
    it 'should return all tests' do
      get '/api/v1/test'

      expect(response).to have_http_status(:success)

      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'POST /test' do
    it "should create new test" do
      expect {
        post '/api/v1/test', params: { test: { name: 'TestName1', address: 'TestAddress1' } }
      }.to change { Test.count }.from(0).to(1)

      expect(response).to have_http_status(:created)

    end
  end

  describe 'DELETE /test' do
    let!(:test) { FactoryBot.create(:test, name: 'test1', address: 'testAddress1') }
    it 'should delete a test' do
      expect{
        delete "/api/v1/test/#{test.id}"
      }.to change {Test.count}.from(1).to(0)

      expect(response).to have_http_status(:no_content)
    end
  end

end