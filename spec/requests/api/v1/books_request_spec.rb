require 'rails_helper'

RSpec.describe 'The books API' do
  it 'sends a list of books' do
    create_list(:book, 3)

    get '/api/v1/books'

    response_body = JSON.parse(response.body, symbolize_names: true)
    books = response_body[:data]

    expect(response).to be_successful
    expect(books.count).to eq(3)

    books.each do |book|
      expect(book).to have_key(:id)
      expect(book[:id]).to be_an(Integer)

      expect(book[:type]).to eq('book')

      expect(book[:attributes]).to have_key(:title)
      expect(book[:attributes][:title]).to be_a(String)

      expect(book[:attributes]).to have_key(:author)
      expect(book[:attributes][:author]).to be_a(String)

      expect(book[:attributes]).to have_key(:genre)
      expect(book[:attributes][:genre]).to be_a(String)

      expect(book[:attributes]).to have_key(:summary)
      expect(book[:attributes][:summary]).to be_a(String)

      expect(book[:attributes]).to have_key(:number_sold)
      expect(book[:attributes][:number_sold]).to be_an(Integer)

      expect(book[:attributes]).to_not include(:created_at)
    end
  end
end
