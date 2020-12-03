require 'rails_helper'

RSpec.describe "Usersrails", type: :request do

  describe "GET /db:rollback" do
    it "returns http success" do
      get "/usersrails/db:rollback"
      expect(response).to have_http_status(:success)
    end
  end

end
