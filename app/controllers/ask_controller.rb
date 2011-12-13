class AskController < ApplicationController


  def new
		if params[:page] && params[:page] != ''
			Sender.salt_question(params[:autor], params[:body]).deliver
			Ask.create(:email=>params[:autor], :body=>params[:body])
			flash[:success] = 'сообщение отправлено'
			redirect_to params[:page]
		end
		render 'new', :layout=>false
  end

end
