class ListsController < ApplicationController
  def new
    @list = List.new #Viewへ渡すためのインスタンス変数にからのModelオブジェクトを生成する。
  end

  def create
    @list = List.new(list_params) #データを受け取り新規登録するためのインスタンス作成
    if @list.save #データをデータベースに保存するためのsaveメソッド実行
      redirect_to list_path(@list.id) #詳細ページへリダイレクト
    else
      render :new  #renderはアクション名で、同じコントローラ内の別のアクションのViewを表示できる
    end
  end

  def index
    @lists = List.all #テーブルに保存されたデータを全取得する
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id]) #データを1件取得
    list.update(list_params) #データのアップデート
    redirect_to list_path(list.id) #詳細ページへリダイレクト
  end

  def destroy
    list = List.find(params[:id]) #データを１件取得
    list.destroy #データを削除
    redirect_to '/lists' #投稿一覧画面へリダイレクト
  end



  private
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
    #params => formから送られてくるデータはparamsの中に入ります。
    #require => 送られてきたデータの中からモデル名（ここでは:list）を指定し、データを絞り込む。
    #permit => requireで絞り込んだデータの中から、保存を許可するカラムを指定します。
  end

end
