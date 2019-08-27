class Map
    attr_accessor :map_array

    def initialize
        self.map_array = []
    end

    def set(k, v)
        pair = get_pair(k)
        if pair
            pair[1] = v
        else
            map_array << [k, v]
        end
    end

    def get_pair(k)        
        map_array.select{|pair| pair[0] == k}.first
    end

    def get(k)
        pair = get_pair(k)
        pair[1] if pair        
    end

    def delete(k)
        pair = get_pair(k)
        map_array.delete(pair) if pair
    end

    def show
        map_array.each do |ele|
            print ele[0].to_s + " => " + ele[1].to_s + "\n"
        end
    end
end

map = Map.new
map.set("a", "b")
map.show
map.set("b", "a")
map.show
map.delete("b")
map.show
print map.get("a")
print map.get("b")