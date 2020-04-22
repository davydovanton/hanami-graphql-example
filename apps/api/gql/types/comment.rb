module Api
  module Gql
    module Types
      class Comment < BaseObject
        description "A blog post"

        field :id, ID, null: false

        field :body, String, null: false
      end
    end
  end
end
