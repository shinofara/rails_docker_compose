# coding: utf-8
class Tasks::Sendmail
  def self.execute
    PostMailer.post_email("to@example.com").deliver
  end
end
