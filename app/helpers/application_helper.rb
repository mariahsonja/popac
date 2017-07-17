module ApplicationHelper
  def data_source(klass)
    klass.pluck(:id, :name).map do |row|
      { value: row.first.to_s, text: row.last }
    end.to_json
  end
end
