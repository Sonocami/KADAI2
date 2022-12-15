class BooksController < ApplicationController
  def index #一覧画面(books)
   @books=Book.all #@booksというインスタンス変数に変えて、View投稿されたところに入れる。（コントローラーがsをつく）
   @book=Book.new #@bookに新しいオブジェクトが格納される
  end

  def create #保存部分
   @book=Book.new(books_paramas) #データを受け取り新登録するためのインスタンス
    if @book.save #データをデータベースに保存するためのsaveメソッドの実行
    flash[:notice]="Book was successfully created."#フラッシュメッセージを定義、詳細画面へリダイレクト
     redirect_to book_path(@book.id)#一覧画面へリダイレクト
    else
     @books=Book.all
     render:index #createはindex内でやっているから
    end
  end

  def show #詳細画面(book)
    @book=Book.find(params[:id])
  end


  def edit #編集画面(edit_book)
    @book=Book.find(params[:id])
  end

  def update #bookのupdate機能
    @book=Book.find(params[:id])
    if @book.update(books_paramas)
    flash[:notice]="Book was successfully updated."#フラッシュメッセージを定義、詳細画面へリダイレクト
    redirect_to book_path(@book) #showに移動する
    else #@book.update(books_paramas)→普通は書かない。ifの反対だから書かなくて良い。
      render:edit #updateはedit内でやっているから
    end
  end

  def destroy #bookのdestroy機能
    @book=Book.find(params[:id])
    @book.destroy
    flash[:notice]="Book was successfully Destroy."#フラッシュメッセージを定義、詳細画面へリダイレクト
    redirect_to books_path #画面そのまま
 end

  #ストロングパラメータ
  def books_paramas
    params.require(:book).permit(:title,:body)
  end
end