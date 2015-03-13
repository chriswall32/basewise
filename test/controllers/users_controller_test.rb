require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = Fabricate(:user)
  end

  context "GET edit" do
    should "render the edit templatea and respond with 200" do
      login_user(@user)
      get :edit, id: @user.id
      assert_response :success
      assert_template :edit
    end
  end

  context "PUT /user/:id" do
    context "params are valid" do
      setup do
        @valid_params = {
            id: @user.id,
            user: {
            first_name: "Michael",
            last_name: "Jackson",
            email: "michael@thriller.com",
            password: "foobar$68"
          }
        }
      end

      should "update the user, redirect to edit, and flash a message" do
        put :update, @valid_params

        @user.reload

        assert_equal "Michael", @user.first_name
        assert_equal "Jackson", @user.last_name
        assert_equal "michael@thriller.com", @user.email
        assert User.authenticate(email: @user.email, password: "foobar$68")
        assert_redirected_to edit_user_path
        assert_equal "Your profile has been updated", flash[:success]
      end
    end

    context "params are invalid" do
      setup do
        @invalid_params = {
            id: @user.id,
            user: {
                first_name: "F"
            }
        }
      end

      should "render edit template" do
        put :update, @invalid_params
        assert_template :edit
      end
    end
  end
end