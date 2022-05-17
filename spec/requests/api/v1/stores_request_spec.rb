require 'rails_helper'

RSpec.describe 'The Stores API' do
  it 'sends a list of stores' do
    create_list(:store, 3)

    get '/api/v1/stores'

    response_body = JSON.parse(response.body, symbolize_names: true)
    stores = response_body[:data]

    expect(response).to be_successful
    expect(stores.count).to eq(3)

    stores.each do |store|
      expect(store).to have_key(:id)
      expect(store[:id]).to be_an(Integer)

      expect(store[:type]).to eq('store')

      expect(store[:attributes]).to have_key(:name)
      expect(store[:attributes][:name]).to be_a(String)

      expect(store[:attributes]).to have_key(:num_books)
      expect(store[:attributes][:num_books]).to be_a(Integer)

      expect(store[:relationships]).to have_key(:books)
    end
  end

  it 'sends data for one store given id' do
    store = create(:store)
    get "/api/v1/stores/#{store.id}"

    store = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(:ok)
    expect(store).to include(:name)
  end
end
