class NoticeMailer < ApplicationMailer

  # ブログ投稿
  def sendmail_picture(picture)
    @picture = picture

    mail to: "naka24naka24@gmail.com",
         subject: '【DIVE14_exam2】写真が投稿されました'
  end

end
