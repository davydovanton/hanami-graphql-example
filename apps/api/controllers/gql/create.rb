module Api
  module Controllers
    module Gql
      class Create
        include Api::Action

        def call(params)
          self.body = Api::Gql::Schema.execute(
            params[:query],
            variables: params[:variables]
          ).to_json
        end
      end
    end
  end
end
