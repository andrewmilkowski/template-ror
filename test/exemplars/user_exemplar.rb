class User < ActiveRecord::Base
  generator_for :login, :method => :next_login
  generator_for :password => 'bobby'
  generator_for :password_confirmation => 'bobby'
  generator_for :email, :method => :next_email
  
  def self.next_login
    @last_login ||= 'bobby'
    @last_login.succ!
  end
  
  def self.next_email
    @base ||= 'BobDobbs'
    @base.succ!
    "#{@base}@example.com"
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

