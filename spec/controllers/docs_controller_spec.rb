require 'rails_helper'


describe DocsController do
  let(:user) {User.create(email: "test@gmail.com", password: "123456")}
  before { allow(controller).to receive(:current_user) { user } }

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

  describe "GET #show" do
    let(:doc) {Doc.create(title: 'RSpec', content: "Today we are ...", user_id: user.id)}

    it 'response with status code 200' do
      get :show, params: {id: doc.id}
      expect(response).to have_http_status 200
    end
    it "assigns the recent docs as @docs" do
      last_doc = Doc.find_by(id: doc.id)
      get :show, params: {id: doc.id}
      expect(assigns(:doc)).to eq(last_doc)
    end

    it "renders the :index template" do
      get :show, params: {id: doc.id}
      expect(response).to render_template(:show)
    end
  end
end
