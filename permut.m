  function [Vals, p] = permut(A,num)
%    Inputs:   A      ,input vector
%              num    ,number of permutations

%    Outputs:  Vals   ,output vector of surrogate values
%              p      ,p value computed as 1 - the fraction of permutation surrogate values smaller than the actual unpermuted mean

%A = [-10 5 4 8 9 2 2 11 16 7 -4 -6 7 -4 -5 -10 -20 12 1 16]; %----Example of array (test)-------%
mu1 = mean(A);            %------Actual mean of input array------%

B=rand(size(A,2),1)-1/2; %-------Generate distribution of random values with positive and negative signs---------%
B=sign(B);               %-------Get array B, where each element corresponds to:
%                                                                                1, when B > 0
%                                                                               -1, when B < 0
 %num=10

%--------------------Generate the loop for permutations-------------------%
for i=1:num           %--------num - number of permutations---------------%

    X = B(randperm(length(B)));    %------Shuffle the signed elements in array B-------%
    Y=A.*X';                       %------Flip the signs of elements in initial input array A------%
    avg(i)=mean(Y);                %------Calculat the average of sign-flipped elemets of array A
%                                         for permutation i --------%
end

Vals=avg';                            %------Transpose the array of permuted mean values-------%

k = size(find(Vals < mu1),1)          %------Find all the elements in a vetor of permuted values 
%                                         less then the actual mean 'mu1'
p=1-k/size((Vals),1);                 %------p-value calculated as a fraction 1 - the fraction of permutation surrogate 
%                                         values smaller than the actual unpermuted mean

hist(avg) ; grid on                    %------Plot distribution of the surrogates (histogram)--------%
hold on 
h1=plot([mu1,mu1],ylim,'r','LineWidth',2)   %------Plot actual mean--------%
%h2=plot([p,p],ylim,'m','LineWidth',2)
hold off

legend([h1],{'Actual mean'});              %------Add figure legend to plot--------%
  end
