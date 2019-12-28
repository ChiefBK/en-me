class EventSerializer
  include FastJsonapi::ObjectSerializer

  attribute :name
  attribute :description

  attribute :starts_at
  def starts_at
    DateTime.now
  end
end
