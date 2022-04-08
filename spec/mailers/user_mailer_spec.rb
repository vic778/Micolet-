require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "newsletter_confirmation" do
    let(:mail) { UserMailer.newsletter_confirmation }

    it "renders the headers" do
      expect(mail.subject).to eq("Newsletter confirmation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
