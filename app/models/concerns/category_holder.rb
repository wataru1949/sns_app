module CategoryHolder
  extend ActiveSupport::Concern

  GENERIC_REGEXP = /\A[\p{han}\p{hiragana}\p{Katakana}\u{30fc}A-Za-z]+\z/

  included do
    include StringNormalizer

    before_validation do
      self.value = normalize_as_generic(value)
    end

    validates :value, presence: true,
    format: { with: GENERIC_REGEXP, allow_blank: true }
    validates :value, uniqueness: { message: "が正しくありません" }
  end
end