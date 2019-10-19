module Persisted
  def persisted
    select(&:persisted?)
  end
end
