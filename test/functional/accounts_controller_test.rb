require 'test_helper'
require 'shoulda_macros/filter'
require 'shoulda_macros/functionals'

class AccountsControllerTest < ActionController::TestCase
  
#  should_have_before_filter :require_no_user, :only => [:new, :create]
#  should_have_before_filter :require_user, :only => [:show, :edit, :update]
  
  context "routing" do
    should_rest_route :new, :edit, :show, :update, :create, :singular => true
    
    # TODO: Figure out what to do about this
    # should_route :get, "/register", :action=>"new", :controller=>"accounts"
    
    context "named routes" do
      setup do
        get :show
      end
      
      should "generate account_path" do
        assert_equal "/account", account_path
      end
      should "generate new_account_path" do
        assert_equal "/account/new", new_account_path
      end
      should "generate edit_account_path" do
        assert_equal "/account/edit", edit_account_path
      end
      should "generate register_path" do
        assert_equal "/register", register_path
      end
    end
  end
    
  context "on GET to :new" do
    setup do
      controller.stubs(:require_no_user).returns(true)
      @the_user = User.generate!
      User.stubs(:new).returns(@the_user)
      get :new
    end
    
    should_assign_to(:user) { @the_user }
    should_respond_with :success
    should_render_template "users/new"
    should_not_set_the_flash
  end

  context "on POST to :create" do
    setup do
      controller.stubs(:require_no_user).returns(true)
      @the_user = User.generate!
      User.stubs(:new).returns(@the_user)
    end
    
    context "with successful creation" do
      setup do
        @the_user.stubs(:save).returns(true)
        post :create, :user => { :login => "bobby", :password => "bobby", :password_confirmation => "bobby" }
      end

      should_assign_to(:user) { @the_user }
      should_respond_with :redirect
      should_set_the_flash_to I18n.t("flash.accounts.create.notice")
      should_redirect_to("the root url") { root_url }
    end
    
    context "with failed creation" do
      setup do
        @the_user.stubs(:save).returns(false)
        post :create, :user => { :login => "bobby", :password => "bobby", :password_confirmation => "bobby" }
      end
      
      should_assign_to(:user) { @the_user }
      should_respond_with :success
      should_not_set_the_flash
      should_render_template "users/new"
    end
  end
  
  context "with a regular user" do
    setup do
      @the_user = User.generate!
      UserSession.create(@the_user)
    end

    context "on GET to :show" do
      setup do
        get :show
      end
    
      should_assign_to(:user) { @the_user }
      should_respond_with :success
      should_not_set_the_flash
      should_render_template "users/show"
    end

    context "on GET to :edit" do
      setup do
        get :edit
      end
    
      should_assign_to(:user) { @the_user }
      should_respond_with :success
      should_not_set_the_flash
      should_render_template "users/edit"
    end

    context "on PUT to :update" do
      context "with successful update" do
        setup do
          User.any_instance.stubs(:update_attributes).returns(true)
          put :update, :user => {:login => "bill" }
        end
      
        should_assign_to(:user) { @the_user }
        should_respond_with :redirect
        should_set_the_flash_to I18n.t("flash.accounts.update.notice")
        should_redirect_to("the user's account") { account_url }
      end
    
      context "with failed update" do
        setup do
          User.any_instance.stubs(:update_attributes).returns(false)
          put :update, :user => {:login => "bill" }
        end
      
        should_assign_to(:user) { @the_user }
        should_respond_with :success
        should_not_set_the_flash
        should_render_template "users/edit"
      end
    end
  end
end
