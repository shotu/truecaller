class EmailService
  def initialize(from, to, subject, text)
    raise "from , to, subject, text are required required" if !from.present? || !to.present? || !subject.present? || !text.present?
    @from = from
    @to = to
    @subject = subject
    @text = text
  end

  # Send email to user
  def send_email_message
    format_message(@text)
    puts "sent email to #{@to}. Subject is #{@subject} .Data is #{@text}"
  end

  # This method
  # Formats the message data and creates email from template
  def format_message(text)
    return text
  end

end