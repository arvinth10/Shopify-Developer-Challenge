class Resolvers::PurchaseProduct <GraphQL::Function

    argument :id, !types.ID
    argument :quantity, !types.Int

    type Types::ProductType

    def call (_obj, args, _ctx)
        begin
            currentProduct = Product.find(args[:id])
            invProduct = currentProduct.attributes['inventory_count'] 
            if invProduct >= args[:quantity]
                currentProduct.update_attribute(:inventory_count, invProduct - args[:quantity])
                currentProduct
            else
                raise "Not enough quantity to complete purchase"
            end
        rescue StandardError => e  
            puts e.message
        end
    end
end