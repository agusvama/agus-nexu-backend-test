require 'rails_helper'

RSpec.describe "Models", type: :request do
  describe "GET /models" do
    before do
      create(:model, name: "MDX")
      create(:model, name: "RDX")
      create(:model, name: "RLX")
    end

    it "returns all models" do
      get "/models"
      expect(response).to have_http_status(:ok)

      models_list = JSON.parse(response.body)
      expect(models_list.size).to eq(3)
      expect(models_list.first["name"]).to eq("MDX")
    end
  end

  describe "GET /brands/:id/models" do
    let(:brand) { create(:brand) }
    let!(:models) { create_list(:model, 3, brand: brand) }

    let(:another_brand) { create(:brand) }
    let!(:another_brand_models) { create_list(:model, 2, brand: another_brand) }

    it "returns models associated with a brand" do
      get "/brands/#{brand.id}/models"
      expect(response).to have_http_status(:ok)

      brand_models_list = JSON.parse(response.body)
      expect(brand_models_list.size).to eq(3)
      expect(brand_models_list.map { |m| m["brand_id"] }.uniq).to eq([brand.id])
    end
  end
end
