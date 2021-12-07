class TodolistsController < ApplicationController
  def new
    #Viewへ渡すためのインスタント変数に空のオブジェクトを生成する
    @list = List.new
  end
    
  def create
    #１. データを新規登録するためのインスタンス作成
    @list = List.new(list_params)
    #２. データをデータベースに保存するためのsaveメソッド実行
    if @list.save
      #保存できたら詳細画面へリダイレクト
      redirect_to todolist_path(@list.id)
    else
      #保存できなければnewのページを再表示
      #HTTPリクエストはない
      render :new
    end
  end
  
  def index
    #@listsとして全てのリストを格納する
    @lists = List.all
  end
  
  def show
    #find(params[:id])：urlと同じidのデータを探し出す
    #レコード1件なので@listは単数
    @list = List.find(params[:id])
  end
  
  def edit
    #特定idのデータを取得する
    @list = List.find(params[:id])
  end
  
  def update
    #特定idのデータを取り出す
    list = List.find(params[:id])
    #同idのlistをアップデート
    list.update(list_params)
    #詳細画面へリダイレクト
    redirect_to todolist_path(list.id)
  end
  
  def destroy
    list = List.find(params[:id]) #データ（レコード）を1件取得
    list.destroy #データ（レコード）を削除
    redirect_to todolists_path #投稿一覧画面へリダイレクト
  end
  
  private
  #ストロングパラメータ：controllerの中でしか呼び出せない
  #アクションとして認識されない
  def list_params
    #入力されたデータを格納
    #params: Railsで送られたデータを受け取る
    #require: データのオブジェクト名を指定
    #permit: データにキーを指定
    params.require(:list).permit(:title, :body, :image)
  end
  
end
