class UsersController < ApplicationController
  # editアクションでは必要になるインスタンス変数はないので、アクションを定義するだけで大丈夫です。
  # def edit
  # end

  # Userモデルの更新を行うupdateアクションは、保存できた場合、できなかった場合で処理を分岐しています。
  # def update
  #   @user = User.new
    # current_user.updateに成功した場合、rootにリダイレクトし、失敗した場合、editのビューを再度描画する、という記述になっています。
  #   if current_user.update(user_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end

  # private

  
  # form_withを使用した時ストロングパラメーター
  # 特定のモデルに特化したフォームを作りたい　→　form_for
  # def user_params
  #   params.require(:user).permit(:name, :email)
  # end
end
