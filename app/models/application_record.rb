class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # uuid生成
  def generate_uuid
    self.id = SecureRandom.uuid
  end
end
