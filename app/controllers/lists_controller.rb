class ListsController < ApplicationController
  def new
    @list = List.new #viewに渡すインスタンス変数=モデル
  end

  def create
    @list = List.new(list_params) # @いる！
    
    if @list.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to list_path(@list.id)
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id]) # paramsいる？
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end

  private # ここから下はこのコントローラ内でしか呼び出し不可
  
  def list_params # ストロングパラメータ:マスアサインメント脆弱性を防ぐ
    params.require(:list).permit(:title, :body, :image)
    # 入力データの中で.listモデルのデータの内.保存するのはこのカラムたちだけ
  end

end
