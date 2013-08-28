class CartesianProduct < Array
    include Enumerable 
    #these objects should consist of the CP of their two inputs
    def initialize(list1, list2)
        if list1 && list2
            #for each elm of list1, make an array that has the next element of list2
            list1.each do |elt| 
              list2.each{|elm| self << [elt, elm]} 
            end
        end    
    end
end

