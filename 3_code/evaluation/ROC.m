function z = ROC(Rank,n)
    Rank=Rank';
    
    loop = size(Rank, 1);
    numerator = 0;
    TP = 0;
    FP = 0;
	AllTP = length(find(Rank == 1));
    
    for i = 1 : loop
        if (Rank(i, 1) == 1)
            TP = TP + 1;
        else
            FP = FP + 1;
            numerator = numerator + TP;
        end
        if (FP >= n)
            break;
        end
    end
    
%    denominator = sum(find(topn(j,:) == 0)) - Num_Positive * (Num_Positive + 1) / 2;
    denominator = FP * AllTP;
    if (numerator == 0)
        z = 0;
    else
        z = numerator / denominator ;
    end
end