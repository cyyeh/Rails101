class Account::GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.participated_groups.recent.paginate(:page => params[:page], :per_page => 5)
  end
end
