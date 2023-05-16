module Account
  class ProfilesController < Account::BaseController
    def show
    end

    def edit
    end

    def update
      current_user.assign_attributes(user_params)

      if !current_user.valid_password?(params[:user][:current_password])
        flash.now[:alert] = 'Mot de passe incorrect'
        render :edit, status: :unprocessable_entity
      elsif current_user.save
        flash[:notice] = 'Compte mis à jour'
        redirect_to account_profiles_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      current_user.update(deleted: true)
      sign_out current_user

      flash[:notice] = 'Votre compte a été supprimé'
      redirect_to root_path
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :birth_date, :phone_number)
    end
  end
end
