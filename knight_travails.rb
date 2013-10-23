require_relative 'dfs_and_bfs'

class KnightPathFinder
  attr_accessor :start_pos, :end_pos

  def initialize(start_pos)
    self.start_pos = start_pos
  end

  def build_move_tree
    start = self.start_pos
    visited_positions = [start]

    move_tree = [TreeNode.new(start)]
    new_move_positions(start).each do |pos|
      move_tree << move_tree[0].create_child(pos)
    end

    stop_adding = false

    until stop_adding
      move_tree.each do |tree_node|
        tree_node.children.each_with_index do |child|
          new_pos = child.value

          next if visited_positions.include?(new_pos)

          visited_positions << new_pos

          new_move_positions(new_pos).each do |pos|
            move_tree << child.create_child(pos)
          end
        end
      end
      stop_adding = true if visited_positions.count == 64
    end
    move_tree
  end

  def new_move_positions(pos)
    i = pos[0]
    j = pos[1]
    array = [[i + 1, j + 2], [i + 1, j - 2], [i - 1, j + 2], [i - 1, j - 2]]
    array += [[i + 2, j + 1], [i + 2, j - 1]]
    array += [[i - 2, j + 1], [i - 2, j - 1]]
    array.delete_if do |pos|
      pos.any? do |el|
        !el.between?(0,7)
      end
    end
    array
  end

  def find_path(target_pos)
    root_node = build_move_tree[0]
    target_node = root_node.bfs(target_pos)

    root_node.path(target_node)
  end

end

k = KnightPathFinder.new([0,0])
p k.find_path([0,7])