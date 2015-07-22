class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "WHY YOU DUMB BASTARD")
    end
  end
end


class Student < ActiveRecord::Base
  validates :email, presence: true, email: true
  validates :cell_phone, :home_phone, :work_phone, format: {
      with: /\d{3}?\d{3}?\d{4}/,
      message: "Bad Dog!, this number isn't legit"
    }
end
