class Api::V1::StoresController < ApplicationController
  def index
    render json: StoreSerializer.new(Store.all)
  end

  def show
    render json: Store.find(params[:id])
  end
end