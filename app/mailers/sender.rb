class Sender < ActionMailer::Base
  default :from => "master@yuliansait.ru"

  def salt_question(autor, question)
		@name = 'вопрос на сайте'
		@autor = autor
		@question = question
		@sender_name = 'Совместные покупки в Иваново'
		mail :to => 'igel.yulian@mail.ru', :subject => @name #, :body => @message
		#render 'salt_account/email_friend'
  end
end
