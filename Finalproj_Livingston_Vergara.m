%%Gisselle L
%%Edward V
%Final Project

%Kings can be implemented by changing the colormap to fit the amount of
%kings there

%If board is empty of 3's colormap favors the 4's color
%Vice versa for empty 4's

%If both are present then colormap is at its fullest

%Change around colormap when kings get removed (just check if there are any
%allied kings)


%Initializing the 8x8 gameboard with 1's and 2's being the pieces of each
%respective player
clc;clear all;close all;

Board = zeros(8);
Board(1,2:2:8) = 1;
Board(2,1:2:8) = 1;
Board(3,2:2:8) = 1;
Board(6,1:2:8) = 2;
Board(7,2:2:8) = 2;
Board(8,1:2:8) = 2;
%Board(6,1) = 1;
%Board(8,1) = 2;
%Board(2,3) = 4;
%Board(4,5) = 3;
%Board(6,1:2:8) = 1;
%Board(3,2:2:8) = 2;


% side = [1;2;3;4;5;6;7;8]
% B_aug  = [side Board]


player_1 = imread('1.jpg');
player_2 = imread('2.jpg');

regpieces = [0];
kingpieces = [0];
%cmap = [1 1 1; 1 0 0 ; 0 0 1; 1 0 1; 0 1 1];

%Initialize the custom color map for Player 1 and Player 2 game pieces
cmap = [1 1 1; 1 0 0 ; 0 0 1];
%cmap goes white;red (Player 1 pieces);blue(Player 2 pieces)
%              magenta(Player 1 kings) cyan(Player 2 kings)

%These are initializations of variables that are necessary inside the main
%while loop
piece_check = 1;
board_check = 1;
jump = 0;
move_row = 1;
move_col = 1;
new_row = 1;
new_col = 1;

%The game starts off with player 1's turn
player_turn = 1;
%pq is used a placeholder variable inside the while loops to hold the
%current game piece value 
pq = 0;

%x,y,f,g,s,q are arrays that later get graphed using the plot function to
%make the grid of the game pop out
x = [1.5 1.5 2.5 2.5 3.5 3.5 4.5 4.5 5.5 5.5 6.5 6.5 7.5 7.5];
y = [0 8.5 8.5 0 0 8.5 8.5 0 0 8.5 8.5 0 0 8.5];
f = [0 8.5 8.5 0 0 8.5 8.5 0 0 8.5 8.5 0 0 8.5];
g = [1.5 1.5 2.5 2.5 3.5 3.5 4.5 4.5 5.5 5.5 6.5 6.5 7.5 7.5];
s = [0.5 8.5 8.5 0.5 0.5];
q = [0.5 0.5 8.5 8.5 0.5];

imagesc(Board)
colormap(cmap)
hold on
plot(x,y,'k',f,g,'k',s,q,'k','LineWidth',2)
%gcf and set are called to make the figure window for the game board pop
%into fullscreen at the start of the script
gcf;
set(gcf,'Position', get(0,'Screensize'));

while(1)
    %dir = input('Please choose a direction to go SW(1)/NW(2)/SE(3)/NE(4):');
    %check = isvalidmove(Board,1,2,dir);
    
    %opted for a msgbox to indicate whose turn it is, it is always
    %displayed on the top left corner
    p1 = msgbox('','Player turn','custom',player_1);
    set(p1, 'position' ,[ 1 550 170 55]);
    while(player_turn == 1)
        %Player 1's turn
        
        %Asks the player to select a valid piece on the board
        while piece_check == 1
            
            %piece_row = input('Please choose the row of the piece you want to move: ');
            piece_row = inputdlg('Row of the piece');
            piece_row = str2double(piece_row{1});
            piece_col = inputdlg('Column of the piece');
            piece_col = str2double(piece_col{1});
            %Opted for the use of inputdlg boxes so that the user doesnt
            %have to input command through the command window,so that way
            %the entire game is played from the game board and doesnt have
            %to go back and forth between windows
            if(piece_row < 1 || piece_row > 8 || piece_col < 1 || piece_col > 8)
                Board
                disp('Invalid Move Please Try Again')
                %Board
            else
                if(Board(piece_row,piece_col) == 1 || Board(piece_row,piece_col) == 3)
                    piece_check = 0;
                    %close(piece_row);
                    %close(piece_col);
                else
                    %the user will continuously be asked until they select
                    %one of their pieces
                    Board
                    disp('Please Select One Of Your Pieces')
                    %Board
                end
            end
            
            
        end
        %Begins the turn of player 1
        while  board_check == 1
            %dir = input('Please choose a direction to go SW(1)/NW(2)/SE(3)/NE(4):');
            dir = inputdlg('Please choose a direction to go SW(1)/NW(2)/SE(3)/NE(4)');
            dir = str2double(dir{1});
            check = isvalidmove(Board,piece_row,piece_col,dir);
            if(check)
                
                
                [move_row,move_col] = move_piece(piece_row,piece_col,dir);
                %input for the function is the moverow and movecol
                piececheck = piecehere(Board,move_row,move_col);
                
                %depending on which game piece is located on the space the
                %piece wants to move to, the situation differs
                switch piececheck
                    case 0
                        %for 0 (empty square on the game board)
                        %the piece moves regularly
                        pq = Board(piece_row,piece_col);
                        Board(piece_row,piece_col) = 0;
                        Board(move_row,move_col) = pq;
                        [new_row,new_col] = move_piece(move_row,move_col,dir);
                    case 1
                        %                         if(isvalidmove(Board,move_row,move_col,dir))
                        %                             [new_row,new_col] = move_piece(move_row,move_col,dir);
                        %                             if(piecehere(Board,new_row,new_col,dir) == 0)
                        %                                 Board(piece_row,piece_col) = 0;
                        %                                 Board(new_row,new_col) = 1;
                        %                         else
                        %                             continue
                        %                         end
                        %for an allied piece (1 and 3) the user will be
                        %asked to move to a different direction
                        continue
                    case 2
                        %if an enemy piece (2 or 4) the script then checks
                        %to see if it is possible to jump over the piece
                        %and remove it from play
                        if(isvalidmove(Board,piece_row,piece_col,dir))
                            [new_row, new_col] = move_piece(move_row,move_col,dir);
                            if(piecehere(Board,new_row,new_col,dir) == 0)
                                pq = Board(piece_row,piece_col);
                                Board(piece_row,piece_col) = 0;
                                Board(move_row,move_col) = 0;
                                Board(new_row,new_col) = pq;
                            else
                                continue
                            end
                        end
                    case 3
                        continue
                    case 4
                        if(isvalidmove(Board,piece_row,piece_col,dir))
                            [new_row, new_col] = move_piece(move_row,move_col,dir);
                            if(piecehere(Board,new_row,new_col,dir) == 0)
                                pq = Board(piece_row,piece_col);
                                Board(piece_row,piece_col) = 0;
                                Board(move_row,move_col) = 0;
                                Board(new_row,new_col) = pq;
                            else
                                continue
                            end
                        end
                end
                
                Board
                board_check = 0;
                %This alters the color map depending on which player has
                %kings at this point in the game. In other words it just
                %changes the array to fit the highest numbers in play so
                %that the pieces dont suddenly change to the wrong color if
                %an enemy king is made or an the last allied king is
                %removed
                if(move_row == 8 && isempty(find(Board == 4)))
                    Board(move_row,move_col) = 3;
                    cmap = [1 1 1; 1 0 0 ; 0 0 1;1 0 1]
                elseif(move_row == 8 && ~isempty(find(Board == 4)))
                    Board(move_row,move_col) = 3;
                    cmap = [1 1 1; 1 0 0 ; 0 0 1; 1 0 1; 0 1 1]
                end
                imagesc(Board)
                colormap(cmap)
                plot(x,y,'k',f,g,'k',s,q,'k','LineWidth',2)
                
                
            else
                Board
                disp('This piece may not move backwards');
                continue
            end
            moveable = enemycheck(Board,move_row,move_col);
            if(~moveable)
                break
            end
            %disp('Hello there');
            
            
            
            imagesc(Board)
            colormap(cmap)
            plot(x,y,'k',f,g,'k',s,q,'k','LineWidth',2)
        end
        
        %end of their turn
        
        
        %changes the value of the player_turn so that player2's turn can
        %follow immediately, and closes the msgbox that has the current
        %players turn
        player_turn = 2;
        close(p1);
    end
    %Check if player 2's piece count is 0 to end the game
    %as long as player 2 has at least 1 regular piece or 1 king the game
    %will continue, if not it ends after Player 1 finishes their turn
    regpieces = find(Board == 2);
    kingpieces = find(Board == 4);
    if(isempty(regpieces) && isempty(kingpieces))
        clc;
        close all;
        clear all;
        imshow('player1won.jpg');
        break
    end
    %reset some values so that the inner while loops won't break
    board_check = 1;
    piece_check = 1;
    while(player_turn == 2)
        %Player 2's turn
        
        %the while loops follow a similar format to Player 1's while loops,
        %except for what the loops are checking for in terms of directional
        %movement and which pieces can get removed, etc.
        
        %Asks the player to select a valid piece on the board
        p2 = msgbox('','Player turn','custom',player_2);
        set(p2, 'position' ,[ 1 550 170 55]);
        while piece_check == 1
            %piece_row = input('Please choose the row of the piece you want to move: ');
            %piece_col = input('Please choose the column of the piece you want to move: ');
            piece_row = inputdlg('Row of the piece');
            piece_row = str2double(piece_row{1});
            piece_col = inputdlg('Column of the piece');
            piece_col = str2double(piece_col{1});
            if(piece_row < 1 || piece_row > 8 || piece_col < 1 || piece_col > 8)
                Board
                disp('Invalid Move Please Try Again')
                %Board
            else
                if(Board(piece_row,piece_col) == 2 || Board(piece_row,piece_col) == 4)
                    piece_check = 0;
                else
                    Board
                    disp('Please Select One Of Your Pieces')
                    %Board
                end
            end
            
            
        end
        %Begins the turn of player 1
        while  board_check == 1
            %dir = input('Please choose a direction to go SW(1)/NW(2)/SE(3)/NE(4):');
            dir = inputdlg('Please choose a direction to go SW(1)/NW(2)/SE(3)/NE(4)');
            dir = str2double(dir{1});
            check = isvalidmove(Board,piece_row,piece_col,dir);
            if(check)
                [move_row,move_col] = move_piece(piece_row,piece_col,dir);
                %input for the function is the moverow and movecol
                piececheck = piecehere(Board,move_row,move_col);
                
                switch piececheck
                    case 0
                        pq = Board(piece_row,piece_col);
                        Board(piece_row,piece_col) = 0;
                        Board(move_row,move_col) = pq;
                        [new_row,new_col] = move_piece(move_row,move_col,dir);
                    case 2
                        %                         if(isvalidmove(Board,move_row,move_col,dir))
                        %                             [new_row,new_col] = move_piece(move_row,move_col,dir);
                        %                             if(piecehere(Board,new_row,new_col,dir) == 0)
                        %                                 Board(piece_row,piece_col) = 0;
                        %                                 Board(new_row,new_col) = 1;
                        %                         else
                        %                             continue
                        %                         end
                        continue
                    case 1
                        if(isvalidmove(Board,piece_row,piece_col,dir))
                            [new_row, new_col] = move_piece(move_row,move_col,dir);
                            if(piecehere(Board,new_row,new_col,dir) == 0)
                                pq = Board(piece_row,piece_col);
                                Board(piece_row,piece_col) = 0;
                                Board(move_row,move_col) = 0;
                                Board(new_row,new_col) = pq;
                            end
                        else
                            continue
                        end
                    case 4
                        continue
                    case 3
                        if(isvalidmove(Board,piece_row,piece_col,dir))
                            [new_row, new_col] = move_piece(move_row,move_col,dir);
                            if(piecehere(Board,new_row,new_col,dir) == 0)
                                pq = Board(piece_row,piece_col);
                                Board(piece_row,piece_col) = 0;
                                Board(move_row,move_col) = 0;
                                Board(new_row,new_col) = pq;
                            end
                        else
                            continue
                        end
                end
                Board
                board_check = 0;
                
                if(move_row == 1 && isempty(find(Board == 3)))
                    Board(move_row,move_col) = 4;
                    cmap = [1 1 1; 1 0 0 ; 0 0 1;0 1 1]
                elseif(move_row == 1 && ~isempty(find(Board == 3)))
                    Board(move_row,move_col) = 4;
                    cmap = [1 1 1; 1 0 0 ; 0 0 1; 1 0 1; 0 1 1]
                end
                imagesc(Board)
                colormap(cmap)
                plot(x,y,'k',f,g,'k',s,q,'k','LineWidth',2)
            else
                Board
                disp('This piece may not move backwards');
                continue
            end
            moveable = enemycheck(Board,move_row,move_col);
            if(~moveable)
                break
            end
            imagesc(Board)
            colormap(cmap)
            plot(x,y,'k',f,g,'k',s,q,'k','LineWidth',2)
            
        end
        
        player_turn = 1;
        close(p2);
    end
    board_check = 1;
    piece_check = 1;
    %Similarly check if player 1's piece count is 0 to end the game
    if(isempty(find(Board == 1)) && isempty(find(Board == 3)))
        clc;
        close all;
        clear all;
        imshow('player2won.jpg');
        break
    end
end


%displays game over on the command window
disp('Game Over')

