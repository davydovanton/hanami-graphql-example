# frozen_string_literal: true

module Comments
  module Operations
    class Create < ::Libs::Operation
      include Import[
        repo: 'repositories.comment'
      ]

      def call(post_id:, body:)
        Success(
          repo.create(post_id: post_id, body: body)
        )
      end
    end
  end
end
