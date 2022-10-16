require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  sign_in create(:admin, email: 'admin@admin.com', password: 'admin123')


  let!(:review) { create(:review, author_name: "mike", author_email: "mike@user.ru", body: "hi", status: 0, created_at: DateTime.now, updated_at: DateTime.now) }

  scenario 'GET #create' do
    context 'with valid attrs' do
      it 'create new review' do
        expect { review :create, params: { review: attributes_for(:review)}}.to change(Review, :count).by(1)

      end
    end

  end
end
