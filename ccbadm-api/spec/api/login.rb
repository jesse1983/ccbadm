require "spec_helper"
describe "API" do
  it 'GET /requests' do
    # FactoryGirl.create_list(:message, 10)

    get '/api/v1/messages'

    # json = JSON.parse(response.body)

    # # test for the 200 status-code
    # expect(response).to be_success

    # # check to make sure the right amount of messages are returned
    # expect(json['messages'].length).to eq(10)
  end
end