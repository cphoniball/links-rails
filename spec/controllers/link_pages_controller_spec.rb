require 'rails_helper'

RSpec.describe LinkPagesController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }

  before { sign_in(user) }

  describe "#index" do
    it "shows link pages belong to the current user" do
      owned_link_page = create(:link_page, user: user)
      other_link_page = create(:link_page)

      get :index

      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(assigns(:link_pages)).to include(owned_link_page)
      expect(assigns(:link_pages)).not_to include(other_link_page)
    end
  end

  describe "#show" do
    context "current user owns requested link page" do
      it "shows the link page" do
        link_page = create(:link_page, user: user)

        get :show, params: { id: link_page.id }

        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:show)
        expect(assigns(:link_page)).to eq(link_page)
        expect(assigns(:link)).to be_a_new(Link)
      end
    end

    context "current user does not own requested link page" do
      it "redirects the user to the link pages index" do
        link_page = create(:link_page)

        get :show, params: { id: link_page.id }

        expect(response).to redirect_to(link_pages_path)
      end
    end
  end

  describe "#create" do
    it "assigns the current user to the link page" do
      post :create, params: { link_page: { name: "Test Link Page", slug: "test-create-link-page" } }

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(link_pages_path)
      expect(assigns(:link_page)).to be_a(LinkPage)
      expect(assigns(:link_page)).to have_attributes(name: "Test Link Page", slug: "test-create-link-page")
      expect(assigns(:link_page).user).to eq(user)
    end
  end

  describe "#edit" do
    context "current user owns requested link page" do
      it "shows the link page" do
        link_page = create(:link_page, user: user)

        get :edit, params: { id: link_page.id }

        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:edit)
        expect(assigns(:link_page)).to eq(link_page)
      end
    end

    context "current user does not own requested link page" do
      it "redirects the user to the link pages index" do
        link_page = create(:link_page)

        get :edit, params: { id: link_page.id }

        expect(response).to redirect_to(link_pages_path)
      end
    end
  end
end
