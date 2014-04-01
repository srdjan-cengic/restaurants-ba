class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :dummy_msg

  def dummy_msg
  	"srle from dummy_msg"
  end
end
