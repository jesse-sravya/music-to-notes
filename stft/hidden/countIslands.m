% Island detection algorithm

% true = 1 false = 0

function count = countIslands(matrix)

    visited = zeros(size(matrix));
    count = 0;
    
    for i=1:size(matrix, 1)
        for j=1:size(matrix, 2)
            if matrix(i, j) && ~visited(i, j)
                visited = DFS(matrix, i, j, visited);
                count = count + 1;
            end
        end
    end
    
end

function visited = DFS(matrix, row, col, visited)

    % Get its 8 neighbours
%     rowNbr = [-1 -1 -1  0  0  1  1  1 ];
%     colNbr = [-1  0  1 -1  1 -1  0  1 ];

    rowNbr = [-1, -1, -1,  0, 0,  1, 1, 1];
    colNbr = [-1,  0,  1, -1, 1, -1, 0, 1];

    % Mark it as visited
    visited(row, col) = 1;
    
    for k=1:8
        safe = isSafe(matrix, row + rowNbr(k), col + colNbr(k), visited);
        if safe == true
            visited = DFS(matrix, row + rowNbr(k), col + colNbr(k), visited);
        end
    end
       
end


% can the given cell be included in the island
function safe = isSafe(matrix, row, col, visited)
    safe = (row >= 1) && (row <= size(matrix, 1)) && ...
    (col >= 1) && (col <= size(matrix, 2)) && ...
    (matrix(row, col) && ~visited(row, col));
end


