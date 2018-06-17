function xStep = addSin(offset)
    T = 100;
    A = 0.2;
    xStep = (0:100:100*length(offset)) + 1;
    
    for i = 1:length(xStep)-1
        out(xStep(i):(xStep(i+1)-1)) = A*sin(T*[xStep(i):(xStep(i+1)-1)]) + offset(i);
    end
    plot(out + 30)
end

