#encoding: utf-8
class HomesController < ApplicationController
	layout :user_layout #'my'

	#def initialize
	#	@curent_page = 'home'
	#end

	def index
		if !params[:id].present?
			@article = Article.first
		else
			begin
				@article = Article.find(params[:id]) || nil
			  @article
			rescue => ex
				redirect_to notready_path
			end
		end
		#@text = "мой текст"
		#flash[:cur_page] = 'index'
		#File.open("marshalled.txt", "w") { |file| Marshal.dump(params.inspect, file) }
  end

  def book
    flash.now[:notice] = 'Перевод книги "Practical Rails Social Networking Sites, Apress (2007)"'
    #flash[:notice] = { 'Текстовое сообщение', :level=>:notice }
    @articles = Article.where(:parent_id => 8)
  end

  def list
  	@articles = Article.find(:all, :conditions => ["id!=1 and id!=2 and id!=3 and parent_id is NULL"], :order => "created_at DESC")
  end

  def notready
  end

  def price
  end

  def enter
  end

  def autoriz
  	if params[:user][:name].blank?
  		flash[:notice] = 'имя не должно быть пустым'
  		redirect_to :back
  	elsif params[:user][:pass].blank?
  		flash[:notice] = 'пароль не должен быть пустым'
  		redirect_to :back
  	else
  		@u = User.find_by_name(params[:user][:name])
  		if @u == nil
	  		redirect_to :back
	  		flash[:notice] = 'не найден пользователь с заданным сочетанием пароля и имени'
  		elsif @u.pass != params[:user][:pass]
  			redirect_to :back
	  		flash[:notice] = 'не найден пользователь с заданным сочетанием пароля и имени'
  		else
  			session[:user_id] = @u.id
  			redirect_to (:controller => 'cms/articles', :action=>'index')
  		end
  	end
  end

  def exit
  	session[:user_id] = nil
  	redirect_to(:action=>'index')
  end

  protected
		def user_layout
			if current_user == nil
			  "my"
			elsif !current_user.admin?
			  "my"
			else
			  "admin"
			end
		end

end
