module Myfinance
  module Entities
    class Attachment < Base
      [:id, :entity_id, :attachment_file_size].each { |k| attribute k, Integer }

      [:title, :attachment_file_name, :attachment_content_type, :download_url].each { |k| attribute k, String }

      [:created_at, :updated_at].each { |k| attribute k, DateTime }

      [:attachables, :links].each { |k| attribute k, Array[Hash[String => String]] }
    end
  end
end
