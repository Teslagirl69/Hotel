require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /index" do
        it 'responses with code 200' do
        get root_path
        expect(response).to have_http_status(200)
  end
  end
end
