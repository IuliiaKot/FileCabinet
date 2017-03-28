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

  describe "GET #new" do

    it "response with status code 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it 'assigns a new doc to @doc' do
      get :new
      expect(assigns(:doc)).to be_a_new Doc
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "responds with status code 302" do
        post :create, params: {doc: {title: 'Rspec', content: "Today we are ..."}}
        expect(response).to have_http_status 302
      end

      it "creates a new doc in the database" do
        post :create, params: {doc: {title: 'Rspec', content: "Today we are ..."}}
        expect(Doc.where(title: 'Rspec')).to exist
      end

      it "assigns the newly created doc as @doc" do
        post :create, params: {doc: {title: 'Rspec', content: "Today we are ..."}}
        expect(assigns(:doc)).to eq(Doc.last)
      end

      it "redirects to the created doc" do
        post :create, params: {doc: {title: 'Rspec', content: "Today we are ..."}}
        expect(response).to redirect_to action: :show, :id => assigns(:doc).id
      end
    end

    context "when invalid params are passed" do
      it "responds with status code 422: Unprocessable Entity" do
        post :create, params: {doc: {title: '', content: "Today we are ..."}}
        expect(response).to have_http_status 422
      end

      it "does not create a new doc in the database" do
        doc_count = Doc.count
        post :create, params: {doc: {title: '', content: "Today we are ..."}}
        expect(Doc.count). to eq(doc_count)
      end

      it "assigns the unsaved doc as @doc" do
        post :create, params: {doc: {title: '', content: "Today we are ..."}}
        expect(assigns(:doc)).to be_a_new Doc
      end

      it "renders the :new template" do
        post :create, params: {doc: {title: '', content: "Today we are ..."}}
        expect(response).to render_template :new
      end
    end
  end
end
