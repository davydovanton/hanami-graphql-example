module Api
  module Gql
    module Types
      class Post < BaseObject
        description "A blog post"

        field :id, ID, null: false

        field :title, String, null: false
        field :body, String, null: false

        field :comments, [Comment], null: true,
          # And fields can have their own descriptions:
          description: "This post's comments, or null if this post has comments disabled."
      end
    end
  end
end
