module Api
  module Gql
    module Types
      class Query < GraphQL::Schema::Object
        include Dry::Monads::Result::Mixin

        description "The query root of this schema"

        # First describe the field signature:
        field :posts, [Post], null: true do
          description "Find a post by ID"
        end

        # First describe the field signature:
        field :post, Post, null: true do
          description "Find a post by ID"
          argument :id, ID, required: true
        end

        # Then provide an implementation:
        def post(id:)
          operation = Container['posts.operations.show']
          result = operation.call(id: id)

          case result
          when Success
            result.value!
          when Failure
            # rollbar.error
            nil
          end
        end

        # Then provide an implementation:
        def posts
          operation = Container['posts.operations.list']
          result = operation.call

          case result
          when Success
            result.value!
          when Failure
            # rollbar.error
            nil
          end
        end
      end
    end
  end
end
