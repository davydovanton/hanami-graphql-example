# frozen_string_literal: true

module Posts
  module Operations
    class List < ::Libs::Operation
      include Import[
        repo: 'repositories.post'
      ]

      def call
        Success(repo.all_with_comments)
      end
    end
  end
end
