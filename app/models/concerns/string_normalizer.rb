require "nkf"

module  StringNormalizer
  extend ActiveSupport::Concern
  
  def normalize_as_generic(text)
    NKF.nkf("-W -w -Z1 -X", text).strip if text
  end
end