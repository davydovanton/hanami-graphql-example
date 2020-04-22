# frozen_string_literal: true

module Posts
  module Operations
    class Create < ::Libs::Operation
      include Import[
        repo: 'repositories.post'
      ]

      def call(title:, body:)
        Success(
          repo.create(title: title, body: body)
        )
      end
    end
  end
end
