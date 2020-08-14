module CategoryHolder
  extend ActiveSupport::Concern

  CATEGORY_REGEXP = /\A[\p{han}\p{hiragana}\p{Katakana}\u{30fc}A-Za-z]+\z/

  included do
    include StringNormalizer

    before_validation do
      self.value = normalize_as_category(value)
    end

    validates :value, presence: true,
    format: { with: CATEGORY_REGEXP, allow_blank: true }
    validates :value, uniqueness: { message: "が正しくありません" }
  end
end