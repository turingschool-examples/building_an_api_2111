class StoreSerializer
  include JSONAPI::Serializer
  attributes :name
  attribute :num_books do |object|
    object.books.count
  end

  has_many :books
end
