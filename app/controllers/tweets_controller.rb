class TweetsController < ApplicationController
  before_action :move_to_index, except: :index
  # before_action :set_user

  def index
    @tweet = Tweet.new
    @tweets = Tweet.all
  end

  def create
    @tweet = Tweet.create(tweet_params)
    redirect_to root_path
  end

  private

  # もし、未ログイン時で新規投稿画面に直接アクセスしても、before_actionにより先にmove_to_indexメソッドが動いてindexアクションのindex.html.erbのページにリダイレクトしてくれます。
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def tweet_params
    params.require(:tweet).permit(:content).merge(user_id: current_user.id)
  end

end
