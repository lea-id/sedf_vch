#coding: utf-8

module UsersHelper

  def gravatar_for(user, options = { :size => 50 })
    gravatar_image_tag(user.email.downcase, :alt => user.fullname,
                                            :class => 'gravatar',
                                            :gravatar => options)
  end

  def role_present?(role)
    !@user.roles.find_by_id(role).nil?
  end
end
