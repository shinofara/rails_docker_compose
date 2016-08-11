# coding: utf-8
class PostMailer < ApplicationMailer
  default from: "from@example.com"

  def post_email(to)
    mail(
      to: to,
      subject: "sample mail",
    ) do |format|
      format.html
    end
  end
end
