Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createProduct, function: Resolvers::CreateProduct.new

  field :purchaseProduct, function: Resolvers::PurchaseProduct.new

end

