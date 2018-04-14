module GroupsHelper
  def is_current_owner_logged_in?(owned)
    current_user && current_user == owned.user
  end

  def is_current_user_belongs_to?(group)
    current_user && current_user.is_member_of?(group)
  end

  def render_group_description(group)
    simple_format(group.description)
  end
end
