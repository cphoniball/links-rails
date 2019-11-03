ActiveSupport::on_load(:active_record) do
  ActiveRecord::Type.register(:url, UrlType)
end
