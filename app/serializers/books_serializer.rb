class BooksSerializer
  def self.format_books(books)
    {
      data: books.map do |book|
        {
          id: book.id,
          type: 'book',
          attributes: {
            title: book.title,
            author: book.author,
            genre: book.genre,
            summary: book.summary,
            number_sold: book.number_sold
          }
        }
      end
    }
  end
end