require_relative './types/base_object'
require_relative './types/comment'
require_relative './types/post'
require_relative './types/query'
require_relative './types/mutation'

module Api
  module Gql
    module Types
    end

    class Schema < GraphQL::Schema
      query Api::Gql::Types::Query
      mutation(Api::Gql::Types::Mutation)
    end
  end
end
