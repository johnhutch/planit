class PlanMailer < ApplicationMailer
  def send_invite(user, plan)
    @user = user
    @plan = plan

    mail(to: @user.email, subject: "Here's an email")
  end

  def send_all_plans(user)
    mail(to: "jonathan.edward.hall@gmail.com", subject: "Your Plans")
  end
end
