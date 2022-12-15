class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

    #after_sign_in_path_forはDeviseが用意しているメソッドでサインイン後にどこに遷移するかを設定している
    def after_sign_in_path_for(resource)
      user_path(@user.id)
    end

    #Deviseが用意しているメソッド。サインアウト後の遷移先の指定
    def after_sign_out_path_for(resource)
      root_path
    end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

  #nameをデータとして保存できるようにするために上記
end
