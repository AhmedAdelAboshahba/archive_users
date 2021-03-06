class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :discarded_at, :discarded_by
end
