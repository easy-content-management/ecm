class Ecm::Sliders::Slider < ActiveRecord::Base
  # associations
  has_many :items, -> { order(:position) },
           dependent: :destroy,
           inverse_of: :slider

  accepts_nested_attributes_for :items, allow_destroy: true

  # scopes
  scope :for_locale, ->(locale) { where(self.arel_table[:locale].eq(locale).or(self.arel_table[:locale].eq(nil))).order(locale: :desc) }

  # callbacks
  after_initialize :set_defaults, if: :new_record?

  # friendly id
  extend FriendlyId
  friendly_id :name, use: :slugged

  # validations
  validates :locale, inclusion: I18n.available_locales.map(&:to_s),
                     if: proc { |slider| slider.locale.present? }
  validates :name, presence: true,
                   uniqueness: { scope: [:locale] }

  def interval_in_milliseconds
    (interval * 1000).to_i
  end

  def human
    "#{name} (#{locale})"
  end

  private

  def set_defaults
    self.auto_start = Ecm::Sliders::Configuration.slider_auto_start if auto_start.nil?
    self.interval ||= Ecm::Sliders::Configuration.slider_interval
  end
end

