module GroupsHelper
  def is_current_owner_logged_in(owned)
    current_user && current_user == owned.user
  end
end
