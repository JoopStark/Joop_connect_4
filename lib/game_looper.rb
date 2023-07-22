class GameLooper

  def initialize(board, player)
    @board = board
    @player = player
  end

  def start_turn
    @board.render_board
    puts "Select a column for your piece(A-G)"
    column = gets.chomp.upcase.intern
    new_token = @player.place_piece(column, @board)
    check_column(new_token)
  end

  def check_column(new_token)
    if new_token == "invalid column, column full" || new_token == "invalid column"
      until new_token != "invalid column, column full" && new_token != "invalid column"
        puts "#{new_token}"
        puts "Select another row(A-G)"
        column = gets.chomp.upcase.intern
        new_token = @player.place_piece(column, @board)
      end
    end
  end

end