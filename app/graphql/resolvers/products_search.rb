require 'search_object/plugin/graphql'

class Resolvers::ProductsSearch

    include SearchObject.module(:graphql)

    scope {Product.all}

    type !types[Types::ProductType]

    option :title, type: types.String, with: :apply_title_filter
    option :has_inventory, type: types.Boolean, with: :apply_inventory_filter

    def apply_title_filter(scope, value)
        scope.where 'title LIKE ?',  value     
    end

    def apply_inventory_filter(scope,value)
        if value
            scope.where 'inventory_count > 0'
        else
            scope.where 'inventory_count <= 0'     
        end
    end

end


