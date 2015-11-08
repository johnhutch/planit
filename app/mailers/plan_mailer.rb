class PlanMailer < ApplicationMailer
  default from: "planit.mailer@gmail.com"

  def invite(person, plan)
    @person = person
    @plan = plan
    mail(to: @person.email, subject: "A Friend of Yours is Totally Looking to Hang")
  end

  def all_plans(person)
    @person = person
    mail(to: @person.email, subject: "A Neatly Organized List of All Your Plans")
  end
end
