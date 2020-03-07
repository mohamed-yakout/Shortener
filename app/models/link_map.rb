class LinkMap < ApplicationRecord
  validates_presence_of :original_url
  validates :original_url, format: URI::regexp(%w[http https])

  validates_uniqueness_of :original_url, :short_data
  validates_length_of :original_url, within: 3..255
  validates_length_of :short_data, within: 3..255

  before_validation :set_short_data

  def set_short_data
    self.short_data = SecureRandom.uuid[0..5] if self.short_data.blank?
    true
  end

  # get full shorten url
  def get_shorten_url
    if Rails.env.production? || Rails.env.development?
      return Rails.application.routes.url_helpers.short_url(short_data: self.short_data)
    end
  end

  # recursive function to create shorten url
  def save_record!
    saved_result = begin
      self.save!
    rescue ActiveRecord::RecordInvalid => invalid
      puts invalid.record.errors
      invalid
    end

    if saved_result == true
      return true
    elsif saved_result.record.errors[:short_data].include?("has already been taken")
      puts "Recursive Working!"
      self.short_data += SecureRandom.uuid[0..2]
      return self.save_record!
    else
      return saved_result
    end
  end
end
