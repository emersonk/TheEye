function class = processClassification(lbl)
    [val, idx] = max(lbl);
     if idx == 1
        class = 'A';
    elseif idx == 2
        class = 'B';
    elseif idx == 3
        class = 'C';
    elseif idx == 4
        class = 'D';
    elseif idx == 5
        class = 'E';
    elseif idx == 6
        class = 'F';
    elseif idx == 7
        class = 'G';
    elseif idx == 8
        class = 'H';
    elseif idx == 9
        class = 'I';
    elseif idx == 10
        class = 'K';
    elseif idx == 11
        class = 'L';
    elseif idx == 12
        class = 'M';
    elseif idx == 13
        class = 'N';
    elseif idx == 14
        class = 'O';
    elseif idx == 15
        class = 'P';
    elseif idx == 16
        class = 'Q';
    elseif idx == 17
        class = 'R';
    elseif idx == 18
        class = 'S';
    elseif idx == 19
        class = 'T';
    elseif idx == 20
        class = 'U';
    elseif idx == 21
        class = 'V';
    elseif idx == 22
        class = 'W';
    elseif idx == 23
        class = 'X';
    elseif idx == 24
        class = 'Y';
    end
end