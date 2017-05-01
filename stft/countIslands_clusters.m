% Island detection algorithm

% true = 1 false = 0

function [clusters, count] = countIslands(matrix, t, f, S)

    visited = zeros(size(matrix));
    count = 0;
    clusters = {};
    clusterID = 1;
    
    for i=1:size(matrix, 1)
        for j=1:size(matrix, 2)
            if matrix(i, j) && ~visited(i, j)
                
                temp = [];
                temp = [temp; [t(1, j), f(1, i), S(i, j)]];
                clusters{clusterID} = temp;
                
                
                [clusters, visited] = DFS(matrix, i, j, visited, clusterID, clusters, t, f, S);
                count = count + 1;
                clusterID = clusterID + 1;
            end
        end
    end
    
end

function [clusters, visited] = DFS(matrix, row, col, visited, clusterID, clusters, t, f, S)

    % Get its 8 neighbours
%     rowNbr = [-1 -1 -1  0  0  1  1  1 ];
%     colNbr = [-1  0  1 -1  1 -1  0  1 ];

    rowNbr = [-1, -1, -1,  0, 0,  1, 1, 1];
    colNbr = [-1,  0,  1, -1, 1, -1, 0, 1];

    % Mark it as visited
    visited(row, col) = 1;
    
    
    for k=1:8
        newRow = row + rowNbr(k);
        newCol = col + colNbr(k);
        safe = isSafe(matrix, newRow, newCol, visited);
        if safe == true
            temp = clusters{clusterID};
            temp = [temp; [t(1, newCol), f(1, newRow), S(newRow, newCol)]];
            clusters{clusterID} = temp;
            [clusters, visited] = DFS(matrix, newRow, newCol, visited, clusterID, clusters, t, f, S);
        end
    end
       
end


% can the given cell be included in the island
function safe = isSafe(matrix, row, col, visited)
    safe = (row >= 1) && (row <= size(matrix, 1)) && ...
    (col >= 1) && (col <= size(matrix, 2)) && ...
    (matrix(row, col) && ~visited(row, col));
end


