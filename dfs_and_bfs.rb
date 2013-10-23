class TreeNode

  attr_accessor :parent, :children, :value

  def initialize(value, children = [])
    self.parent = nil
    self.children = children
    self.value = value
  end

  def left
    self.children[0]
  end

  def right
    self.children[1]
  end

  def left=(value)
    self.children[0] = TreeNode.new(value)
    self.children[0].parent = self
  end

  def right=(value)
    self.children[1] = TreeNode.new(value)
    self.children[1].parent = self
  end

  def dfs(target)
    return self if self.value == target
    return if self.children.empty?

    found_num = self.left.dfs(target) if self.children.count > 0

    return found_num if found_num

    found_num = self.right.dfs(target) if self.children.count > 1

    if found_num
      return found_num
    else

      return nil
    end
  end

  def bfs(target)
    arr = []
    arr << self

    until arr.empty?
      temp = arr.shift
      return temp if temp.value == target

      arr = arr + temp.children if !temp.children.empty?
    end
  end

  def print_dfs(target)
    result = self.dfs(target)
    p (result.nil? ? "Did not find a number." : result.value)
  end

  def print_bfs(target)
    result = self.bfs(target)
    p (result.nil? ? "Did not find a number." : result.value)
  end

end



my_tree = TreeNode.new(5)
my_tree.left = 7
my_tree.right = 8
my_tree.left.left = 9
my_tree.left.left.left = 4
my_tree.right.left = 3
my_tree.right.left.left = 2

my_tree.print_bfs(8)
my_tree.print_dfs(3)




def dfs(target)
  return self if self.value == target
  return if self.children.empty?

  i = 0

  while i < self.children.count - 1

    found_num = self.children[i].dfs(target)

    return found_num if found_num
    i += 1
  end

  found_num = self.children[0].dfs(target)

  return found_num if found_num

  found_num = self.children[1].dfs(target) if self.children.count == 2

  return found_num if found_num

  found_num = self.children[2].dfs(target) if self.children.count == 3

  if found_num
    return found_num
  else

    return nil
  end
end



































