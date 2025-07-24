require 'rails_helper'

RSpec.describe "Brands", type: :request do
  describe "GET /brands" do

    before do
      create(:brand, name: "Audi")
      create(:brand, name: "Bentley")
      create(:brand, name: "BMW")
    end

    it "returns all brands" do
      get "/brands"
      expect(response).to have_http_status(:ok)

      brands_list = JSON.parse(response.body)
      expect(brands_list.size).to eq(3)
      expect(brands_list.first["name"]).to eq("Audi")
    end
  end

  describe "POST /brands" do
    let(:brand_params) { { name: "Audi" } }

    it "creates a new brand" do
      expect {
        post "/brands", params: { brand: brand_params }
      }.to change(Brand, :count).by(1)

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["name"]).to eq("Audi")
    end

    context "when brand name is not unique" do
      before do
        create(:brand, name: "Audi")
      end

      it "does not allow duplicated brand names" do
        post "/brands", params: { brand: brand_params }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)["errors"]).to include("Name has already been taken")
      end
    end
  end
end
