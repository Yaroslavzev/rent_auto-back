# Дефолтный мейлер для отправки писем администратору проката
class AdminMailer < ApplicationMailer
  def request_email
    @parameters = params[:parameters]
    mail(to: 'rentauto.gb@mail.ru', subject: 'Новый заказ с сайта rent-auto.biz.tm')
  end
end
