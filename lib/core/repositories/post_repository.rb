class PostRepository < Hanami::Repository
  relations :comments

  associations do
    has_many :comments
  end

  def find!(id)
    root.by_pk(id).limit(1).map_to(Post).one!
  end

  def all_with_comments
    aggregate(:comments).map_to(Post).to_a
  end

  def find_with_commnets(id)
    aggregate(:comments).by_pk(id).limit(1).map_to(Post).one
  end
end
