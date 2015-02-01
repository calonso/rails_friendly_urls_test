class FriendlyUrl < ActiveRecord::Base

  include RailsFriendlyUrls::FriendlyUrl

  belongs_to :article

  before_create :complete_url

  after_save :reload_routes

  serialize :defaults

  validates :slug, presence: true, uniqueness: true

  def complete_url
    self.path = "/articles/#{article.reload.id}"
    set_destination_data!
  end

  def reload_routes
    RailsFriendlyUrls::Manager.apply_changes!
  end
end
