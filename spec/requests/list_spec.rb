require 'rails_helper'

RSpec.describe "Lists", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/list/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/list/create"
      expect(response).to have_http_status(:success)
    end
  end

end
