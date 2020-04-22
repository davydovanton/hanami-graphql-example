# frozen_string_literal: true

module Posts
  module Operations
    class Show < ::Libs::Operation
      include Import[
        repo: 'repositories.post'
      ]

      def call(id:)
        result = repo.find_with_commnets(id)
        result ? Success(result) : Failure(:not_found)
      end
    end
  end
end
