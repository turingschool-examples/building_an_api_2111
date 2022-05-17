class StoresSerializer
  def self.format_stores(stores)
    {
      data: stores.map do |store|
        {
          id: store.id,
          type: 'store',
          attributes: {
            name: store.name,
            num_books: store.books.count
          },
          relationships: {
            books: {
              data: store.books.map do |book|
                {
                  id: book.id,
                  type: 'book'
                }
              end
            }
          }
        }
      end
    }
  end
end