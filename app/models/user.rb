class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.merge_validates_format_of_login_field_options :allow_blank => true
    c.merge_validates_format_of_email_field_options :allow_blank => true, :unless => "email && email.size < 6"
    c.merge_validates_confirmation_of_password_field_options :allow_blank => true
    c.merge_validates_length_of_password_confirmation_field_options :if => "false"
    # Put any authlogic customizations here; see the authlogic help
  end
  
  serialize :roles, Array
  
  before_validation_on_create :make_default_roles
  after_create :send_welcome_email
  
  attr_accessible :login, :password, :password_confirmation, :email, :first_name, :last_name
  
  def display_name
    "#{first_name} #{last_name}".strip
  end
  
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
  
  def admin?
    has_role?("admin")
  end
  
  def has_role?(role)
    roles.include?(role)
  end
     
  def has_any_role?(*roles)
    roles.each do |role|
      return true if has_role?(role)
    end
    false
  end

  def add_role(role)
    self.roles << role unless self.has_role?(role)
  end
     
  def remove_role(role)
    self.roles.delete(role)
  end
  
  def clear_roles
    self.roles = []
  end
  
  def has_permission?(action)
    case action.to_sym
    when :view_admin_data
      admin?
    when :edit_admin_data
      admin?
    else
      false
    end
  end

  def kaboom!
    r = RegExp.new("foo")
  end

private
  def make_default_roles
    clear_roles if roles.nil?
  end
  
  def send_welcome_email
    Notifier.deliver_welcome_email(self)
  end
end

# == Schema Information
#
# Table name: users
#
#  id                :integer(4)      not null, primary key
#  created_at        :datetime
#  updated_at        :datetime
#  login             :string(255)     not null
#  crypted_password  :string(255)     not null
#  password_salt     :string(255)     not null
#  persistence_token :string(255)     not null
#  login_count       :integer(4)      default(0), not null
#  last_request_at   :datetime
#  last_login_at     :datetime
#  current_login_at  :datetime
#  last_login_ip     :string(255)
#  current_login_ip  :string(255)
#  roles             :string(255)
#  first_name        :string(255)
#  last_name         :string(255)
#  perishable_token  :string(255)     default(""), not null
#  email             :string(255)     default(""), not null
#
# Indexes
#
#  index_users_on_login              (login)
#  index_users_on_persistence_token  (persistence_token)
#  index_users_on_last_request_at    (last_request_at)
#  index_users_on_perishable_token   (perishable_token)
#  index_users_on_email              (email)
#

