# Railsでは、悪意のあるユーザーの入力に対してセキュリティ対策を行わないと保存できない仕組みがあります。

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # コントローラーに設定して、ログイン済ユーザーのみにアクセスを許可する
  # before_action :authenticate_user!
  # 通常のテーブルに保存する際はストロングパラメータを使用しましたが、deviseを使ったモデルの場合は方法が異なります。
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # deviseをインストールすることでdevise_parameter_sanitizerのpermitメソッドが使えるようになりますが、これがストロングパラメータに該当する機能です。
  # サインアップ時に入力された「name」キーの内容の保存を許可しています。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
