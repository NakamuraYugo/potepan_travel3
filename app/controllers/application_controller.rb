class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protect_from_forgery
  # 以下を記述
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_q #すべてのアクションが行われる前にset_qアクションを行う。限定もできる。
  before_action :set_user, if: -> { user_signed_in? } 
  #これでログインしている時(trueを返すとき)だけbefore_actionが実行される。user_signed_in?はdeviseのメソッド。
  before_action :configure_account_update_params, if: :devise_controller?

  
  def search
    @results = @q.result(distinct: true).includes(%i[user]).order(created_at: :desc) #事前にset_qアクションが行われる、@q.resultで検索結果を表示している。
  end

  private

  def set_q
    @q = Room.ransack(params[:q]) #ここで検索機能で入力された値を受け取っている。
  end

  def set_user
    @user = User.find(current_user.id)
  end

  protected

  def configure_permitted_parameters
    #以下の:name部分は追加したカラム名に変える
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :introduction, :user_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :current_password])
    #アカウントedit時にemail,encrypted_passwordが登録できる
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password])
  end
end
