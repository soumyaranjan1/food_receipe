class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    params[:user].permit!
    @user = User.new(params[:user])
    if @user.save
      current_user.move_to(@user) if current_user && current_user.guest?
      sign_up("user", @user)
      redirect_to new_user_session_path
    else
      render :new
    end
  end


end