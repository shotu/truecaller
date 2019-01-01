module Api
  module V1
    module Protected
      class UsersController < ApplicationController
        def search_users
          user = User.create!(email:"manish@cogoport", phone:"8884877977")
          render json: user
        end

      end
    end
  end
end
