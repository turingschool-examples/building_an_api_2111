class Api::V1::BooksController < ApplicationController
  def index
    render json: BooksSerializer.format_books(Book.all), status: :ok
  end
end
