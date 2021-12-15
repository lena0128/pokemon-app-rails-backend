class PokemonSerializer < ActiveModel::Serializer
  attributes :id, :name, :poke_type, :weight, :front_image, :back_image
end
