function[p_row p_col] = move_piece(row,col,direction)
switch direction
    case 1
        p_row = row +1;
        p_col = col - 1;
    case 2
        p_row = row - 1;
        p_col = col - 1;
    case 3
        p_row = row+1;
        p_col = col+1;
    case 4
        p_row = row -1;
        p_col = col+1;
    otherwise
        return
end
end
%Please choose a direction to go SW(1)/NW(2)/SE(3)/NE(4)