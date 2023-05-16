# frozen_string_literal: true

module Account
  class ProfessionalsController < Account::BaseController
    before_action :set_professional_acount, only: %i[new edit update]

    def new; end

    def create
      @professional_account = current_user.build_professional(professional_params)

      if @professional_account.save
        flash[:notice] = 'Vos informations ont bien été enregistrées'
        redirect_to account_profiles_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      @professional_account.assign_attributes(professional_params)

      if @professional_account.save
        flash[:notice] = 'Vos informations ont bien été enregistrées'
        redirect_to account_profiles_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def set_professional_acount
      @professional_account = Professional.find_by(user: current_user) || Professional.new
    end

    def professional_params
      params.require(:professional).permit(:name, :siret)
    end
  end
end
