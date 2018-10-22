function [output] = enemycheck(mat,row,col)
%take in the current row and column and check if there is an enemy piece
%in a forward diagonal for 1's and 2's, or backwards as well for 3's and
%4's

%Please choose a direction to go SW(1)/NW(2)/SE(3)/NE(4)


gamepiece = mat(row,col);
switch gamepiece
    case 1
        %If a 1 is at the leftmost column, then the only place it can look
        %for another enemy piece is to the SE
        if(isvalidmove(mat,row,col,1))
            if(mat(row+1,col-1) == 2||mat(row+1,col-1) == 4)
                output = 1;
                return
            end
            
            %If it is at the rightmost column then the only place it can look
            %for another enemy piece is to the SW
        elseif(isvalidmove(mat,row,col,3))
            if(mat(row+1,col +1) == 2 || mat(row+1,col+1) == 4)
                output = 1;
                return
            end
            %Because its looking in one direction at a time, if theres no
            %enemy pieces by this else statement then there are no enemies
        else
            
            output = 0;
            return
            
        end
        %Please choose a direction to go SW(1)/NW(2)/SE(3)/NE(4)
    case 2
        if(isvalidmove(mat,row,col,2))
            if(mat(row - 1, col - 1) == 1 ||mat(row - 1, col - 1) == 3 )
                output = 1;
                return
            end
        elseif(isvalidmove(mat,row,col,4))
            if(mat(row - 1,col + 1) == 1 || mat(row - 1,col + 1) == 3)
                output = 1;
                return
            end
        else
            output = 0;
            return
            
        end
    case 3
        if(isvalidmove(mat,row,col,1))
            if(mat(row+1,col-1) == 2||mat(row+1,col-1) == 4)
                output = 1;
                return
            end
            
            %If it is at the rightmost column then the only place it can look
            %for another enemy piece is to the SW
        elseif(isvalidmove(mat,row,col,3))
            if(mat(row+1,col +1) == 2 || mat(row+1,col+1) == 4)
                output = 1;
                return
            end
        elseif(isvalidmove(mat,row,col,2))
            if(mat(row - 1, col - 1) == 2 ||mat(row - 1, col - 1) == 4 )
                output = 1;
                return
            end
        elseif(isvalidmove(mat,row,col,4))
            if(mat(row - 1,col + 1) == 2 || mat(row - 1,col + 1) == 4)
                output = 1;
                return
            end
        else
            output = 0;
            return                
        end
    case 4
        if(isvalidmove(mat,row,col,1))
            if(mat(row+1,col-1) == 1||mat(row+1,col-1) == 3)
                output = 1;
                return
            end
            
            %If it is at the rightmost column then the only place it can look
            %for another enemy piece is to the SW
        elseif(isvalidmove(mat,row,col,3))
            if(mat(row+1,col +1) == 1 || mat(row+1,col+1) == 3)
                output = 1;
                return
            end
        elseif(isvalidmove(mat,row,col,2))
            if(mat(row - 1, col - 1) == 1 ||mat(row - 1, col - 1) == 3 )
                output = 1;
                return
            end
        elseif(isvalidmove(mat,row,col,4))
            if(mat(row - 1,col + 1) == 1 || mat(row - 1,col + 1) == 3)
                output = 1;
                return
            end
        else
            output = 0;
            return                
        end
        
    otherwise
        output = 0;
end
output = 0;
end