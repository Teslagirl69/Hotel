# frozen_string_literal: true


  class Admin::PagesController < ApplicationController
    before_action :authenticate_admin!
    def dashboard; end
  end
end
