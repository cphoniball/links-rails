class UrlType < ActiveRecord::Type::String
  def cast(value)
    if value.nil?
      super(nil)
    elsif value.start_with?("http://", "https://")
      super(value)
    else
      super("https://#{value}")
    end
  end
end
