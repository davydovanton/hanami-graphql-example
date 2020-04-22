class CommentRepository < Hanami::Repository
  relations :posts

  associations do
    belongs_to :post
  end
end
