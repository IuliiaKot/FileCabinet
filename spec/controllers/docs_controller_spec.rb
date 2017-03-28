require 'rails_helper'


describe DocsController do
  describe "GET #index" do
    it 'response with status code 200' do
      get :index
      expect(response).to have_http_status 200
    end
    it "assigns the recent docs as @docs" do
      docs = Doc.all
      get :index
      expect(assigns(:docs)).to eq(docs)
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
