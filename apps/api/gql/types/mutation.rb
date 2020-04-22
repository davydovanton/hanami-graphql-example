module Api
  module Gql
    module Types
      class Mutation < BaseObject

        class BaseMutation < GraphQL::Schema::RelayClassicMutation
          # # Add your custom classes if you have them:
          # # This is used for generating payload types
          # object_class Types::BaseObject
          # # This is used for return fields on the mutation's payload
          # field_class Types::BaseField
          # # This is used for generating the `input: { ... }` object type
          # input_object_class Types::BaseInputObject
        end

        class CreateComment < BaseMutation
          include Dry::Monads::Result::Mixin

          null true

          argument :body, String, required: true
          argument :post_id, ID, required: true

          field :comment, Types::Comment, null: true
          field :errors, [String], null: false

          def resolve(body:, post_id:)
            operation = Container['comments.operations.create']
            result = operation.call(post_id: post_id, body: body)

            case result
            when Success
              {
                comment: result.value!.to_h,
                errors: [],
              }
            when Failure
              {
                comment: nil,
                errors: result.failure
              }
            end
          end
        end

        field :create_comment, mutation: CreateComment
      end
    end
  end
end
