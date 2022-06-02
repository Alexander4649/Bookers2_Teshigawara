class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?#devise利用の機能（ユーザ登録、ログイン認証など）が使われる前にconfigure_permitted_parametersメソッドが実行されます。
  #もし、deviseの処理を行う場合、configure_permitted_parametersというものを実行してね」という意味
  
#  def after_sign_in_path_for(resource)#サインイン後にどこに遷移するかを設定しているメソッド
#  show_path
#  end


  
#  def after_sign_out_path_for(resource)#サインアウト後にどこに遷移するかを設定するメソッド
#19番   top_path
#  end

  protected

  def configure_permitted_parameters#configure_permitted_parametersメソッドでは、devise_parameter_sanitizer.permitメソッドを使うことでユーザー登録(sign_up)の際に、
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])#メールアドレス(email)のデータ操作を許可しています。
  end
end
