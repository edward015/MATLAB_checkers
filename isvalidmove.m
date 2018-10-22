function [output] = isvalidmove(mat,row, col, direction)
    temp_row = row;
    temp_col = col;
    %Please choose a direction to go SW(1)/NW(2)/SE(3)/NE(4):
    switch direction
        case 1
            if(col == 1)
                output = 0;
                return
            end
            temp_row = temp_row + 1;
            temp_col = temp_col - 1;
            direction = "SW";
        case 2
            if(col == 1)
                output = 0;
                return;
            end
            %disp("y")
            direction = "NW";
            temp_col = temp_col - 1;
            temp_row = temp_row - 1;
        case 3
            %disp("no")
            if(col == 8) 
                output = 0;
                return
            end
            direction = "SE";
            temp_col = temp_col + 1;
            temp_row = temp_row + 1;
        case 4
            if(col == 8)
                output = 0;
                return
            end
            %disp("n")
            direction = "NE";
            temp_col = temp_col + 1;
            temp_row = temp_row - 1;
        otherwise
            direction = "UK";
    end
    
    if(direction == "UK")
        output = 0;
        disp('Invalid move, choose a valid move')
        return
    end
    if(temp_col == 0 || temp_col == 9 || temp_row == 0 || temp_row == 9)
        output = 0;
        disp('Invalid move, choose a valid move')
        return
    end
    
    if(mat(row,col) == 1 && (direction == "NW" || direction == "NE"))
        output = 0;
        disp('Invalid move, choose a valid move')
        return
    end
    if(mat(row,col) == 2 && (direction == "SW" || direction == "SE"))
        output = 0;
        disp('Invalid move, choose a valid move')
        return
    end
    output = 1;
end
%1 = true
%0 = false
%Switch staements can be used to find out if two variables hold the same
%string